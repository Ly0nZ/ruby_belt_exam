class SongsController < ApplicationController
  def index
  	@songs = Song.all
  end

  def create
  	@song = Song.new(song_params)

  	if @song.save
      redirect_to '/songs'
    else
      flash[:errors] = @song.errors.full_messages
      redirect_to :back
    end
  end

  def show
  	@song = Song.find(params[:id])
  	@users = @song.users
  	#@adds = @user.adds.where(song_id: params[:id]).count

  end

	private
	  def song_params
	  	params.require(:song).permit(:title, :artist)
	  end
end
