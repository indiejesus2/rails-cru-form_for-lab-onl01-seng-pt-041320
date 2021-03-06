class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def show
        song
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(song_params)
        @song.save
        redirect_to song_path(@song)
    end

    def edit
        song
    end

    def update
        song
        @song.update(song_params)
        redirect_to song_path(@song)
    end

    private

    def song_params
        params.require(:song).permit(:name, :artist_id, :genre_id)
    end

    def song
        @song = Song.find(params[:id])
        @genre = Genre.find(@song.genre_id)
        @artist = Artist.find(@song.artist_id)
    end

end