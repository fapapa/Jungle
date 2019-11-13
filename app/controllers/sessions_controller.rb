class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    # If the user exists AND the password entered is correct
    if @user && @user.authenticate(params[:password])
      # Save the user id in the cookie. This is how we keep the user logged in
      session[:user_id] = @user.id
      redirect_to '/', notice: 'Successfully logged in'
    else
      # If user's login doesn't work, send them back to the login form.
      redirect_to '/login', notice: 'Wrong email or password. Please try again.'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login', notice: 'You have been successfully logged out.'
  end
end
