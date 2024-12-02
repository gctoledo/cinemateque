class SectionsController < ApplicationController
  def index
    @sections = Section.all
  end

  def new
    @section = Section.new
    @movies = Movie.all
    @rooms = Room.all
  end

  private

  def set_movie_theater
    @movie_theater = MovieTheater.find(params[:movie_theater_id])
  end
end