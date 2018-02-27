class AddsController < ApplicationController

	def create
  	Add.create(user_id: session[:user_id], song_id: params[:id])
  	redirect_to '/songs'
  end
end
