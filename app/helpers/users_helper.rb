module UsersHelper

  def appeal(user)
    return "Hi, #{user.name}!"     unless user.name.empty?
    return "Hi, #{user.username}!" unless user.username.empty?
    user.email
  end

  def guest(obj)
    return "guest@rubypaste.io" if obj == "email" && params[:guest] == '1'
    return "guestpassword"      if obj == "password" && params[:guest] == '1'
  end
end
