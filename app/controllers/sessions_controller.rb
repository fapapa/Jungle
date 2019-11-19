class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate_with_credentials(
      params[:email],
      params[:password]
    )

    if user
      session[:user_id] = user.id
      redirect_to '/', notice: 'Successfully logged in'
    else
      redirect_to '/login', notice: 'Wrong email or password. Please try again.'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login', notice: 'You have been successfully logged out.'
  end
end
