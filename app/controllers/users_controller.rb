class UsersController < ApplicationController
  def index
    if session[:user_id]
      redirect_to '/songs'
    else
      render 'users/index.html.erb'
    end
  end
	def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to '/songs'
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @user = User.find(params[:id])
    @songs = @user.songs
    #@user = current_user
    #@adds = @user.adds.where(song_id: params[:id]).count
  end

=begin
  def show
    @user = User.find(params[:id])
    @songs = @user.joins(:songs)
    #@adds = @songs.adds.where(user_id: params[:id]).count
  end
=end
  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
