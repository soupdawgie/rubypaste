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
end
