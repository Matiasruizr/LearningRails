require 'rspotify'
RSpotify.authenticate("fdf310728fcd457d89ea528ba2140c5d",  "d66e6f26642f4ef3bb06759fa2e5d72c")

class SpotifyController < ApplicationController
  def search
    @title = params[:title]
    if @title
      @results = RSpotify::Track.search(@title)
    end
  end
end
