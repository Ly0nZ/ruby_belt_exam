class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by(email: params[:email])

  	if @user && @user.authenticate(params[:password])
  		session[:user_id] = @user.id
  		redirect_to '/songs'
  	else
  		flash[:errors] = ["Incorrect login credentials."]
  		redirect_to :back
  	end
  end
  def destroy
    session.delete(:user_id)
    redirect_to '/main'
  end
end
