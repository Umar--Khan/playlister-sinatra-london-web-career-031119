class SongsController < ApplicationController
    
  get '/songs' do 
      @songs = Song.all    
      erb :"songs/index"
  end

  get 'songs/:slug' do
      @songs = Song.find_by_slug(params[:slugs])
      erb :"songs/show"
  end

end
