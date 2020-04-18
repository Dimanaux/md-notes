module ApplicationHelper
  def application_root_url
    root_url(subdomain: '')
  end

  def destroy_session_url
    destroy_user_session_url(subdomain: '')
  end

  def new_session_url
    new_user_session_url(subdomain: '')
  end

  def new_registration_url
    new_user_registration_url(subdomain: '')
  end
end
