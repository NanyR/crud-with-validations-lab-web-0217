require 'pry'
class SongsController < ApplicationController

  def index
    @songs=Song.all
  end

  def new
    @song= Song.new
  end

  def create
    @song=Song.new(song_params(:title, :released, :release_year, :artist_name, :genre))
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def show
    @song= set_song
  end

  def edit
    @song= set_song
  end

  def update
    @song= set_song
    @song.update(song_params(:title, :released, :release_year, :artist_name, :genre))
    if @song.valid?
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song= set_song
    @song.destroy
    redirect_to songs_path
  end


  private

  def set_song
    Song.find_by_id(params[:id])
  end

  def song_params(*args)
    params.require(:song).permit(args)
  end

end
