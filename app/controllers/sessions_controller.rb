class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      @error_msg = 'Wrong Username or Password, Please try again!!'
      render 'new'
    end
  end

  def signout
    session[:user_id] = nil
    redirect_to '/'
  end
end
