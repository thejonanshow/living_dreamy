class SessionsController < ApplicationController

  skip_before_filter :authenticate!

  def create
    google_apps_authenticate "hungrymachine.com", 'callback', [:email]
  end

  def destroy
    email = session.delete(:user_id)
    flash[:notice] = "Signed out."
    redirect_to new_session_path
  end

  def callback
    response = google_apps_handle_auth
    if response.failed? or response.canceled?
      flash[:notice] = "Could not authenticate: #{response.error}"
    else
      authorize(response[:email].first)
    end
  end

  private

  # Jonan: in this application you couldn't login (even if you could
  # authenticate through Google Apps) unless there was a User record
  # with your email address. If your application is more open, you
  # could just find or create by email instead.

  def authorize(email)
    authorized = User.find_or_create_by_email(email)

    if authorized
      flash[:notice] = "Signed in #{authorized.email}"
      session[:user_id] = authorized.id
      if session[:destination]
        destination = session.delete(:destination)
      else
        destination = root_path
      end
      redirect_to destination
    else
      flash[:error] = "You are not authorized for this application."
      redirect_to new_session_path
    end
  end

end
