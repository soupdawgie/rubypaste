class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_sanitized_params, if: :devise_controller?

  def after_sign_in_path_for(resource)
     request.env['omniauth.origin'] || snippets_path || root_path
  end

  # if user is logged in, return current_user, else return guest_user
def current_or_guest_user
  if current_user
    if session[:guest_user_id] && session[:guest_user_id] != current_user.id
      logging_in
      # reload guest_user to prevent caching problems before destruction
      guest_user(with_retry = false).reload.try(:destroy)
      session[:guest_user_id] = nil
    end
    current_user
  else
    guest_user
  end
end

# find guest_user object associated with the current session,
# creating one as needed
def guest_user(with_retry = true)
  # Cache the value the first time it's gotten.
  @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)

rescue ActiveRecord::RecordNotFound # if session[:guest_user_id] invalid
   session[:guest_user_id] = nil
   guest_user if with_retry
end

  protected

  def configure_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:email, :username, :name, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:email, :username, :name, :password, :password_confirmation,
                                                    :current_password)
    end
  end

end

private
def create_guest_user
  u = User.create(:name => "guest", :email => "guest_#{Time.now.to_i}#{rand(100)}@example.com")
  u.save!(:validate => false)
  session[:guest_user_id] = u.id
  u
end
