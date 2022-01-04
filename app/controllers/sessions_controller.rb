# frozen_string_literal: true

#= SessionsController
#
# Controller class used to handle
# basic app authentication
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by username: session_params[:username]
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      flash[:success] = 'You have been successfully logged in'
      redirect_to root_path
    else
      flash.now[:error] = 'There was something wrong with your login information'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You have successfully logged out'
    redirect_to login_path
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end