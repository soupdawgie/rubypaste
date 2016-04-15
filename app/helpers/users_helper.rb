module UsersHelper

  def appeal(user)
    if !user.name.empty?
      "Hi, #{user.name}!"
    elsif !user.username.empty?
      "Hi, #{user.username}!"
    else
      user.email
    end
  end

	def guest(obj)
		if obj == "email" && params[:guest] == '1'
			"guest@rubypaste.io"
		elsif obj == "password" && params[:guest] == '1'
			"guestpassword"
		end
	end

end
