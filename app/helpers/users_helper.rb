module UsersHelper
  def user_profile_url(user)
    user_url(subdomain: user.username)
  end

  def edit_registration_url
    edit_user_registration_url(subdomain: "")
  end
end
