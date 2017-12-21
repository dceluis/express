class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    login(params[:email], params[:password], params[:remember_me])
    redirect_to conversations_url, success: 'You have successfully logged in'
  end

  def destroy
    logout
    redirect_to root_url
  end
end
