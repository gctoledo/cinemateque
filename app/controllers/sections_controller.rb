class SectionsController < ApplicationController
  def index
    @sections = Section.all
  end

  def new
    @section = Section.new
    set_movies_rooms
  end

  def create
    @section = Section.new(time: section_params[:time], week_day: section_params[:week_day], room_id: params[:room_id], movie_id: params[:movie_id])

    if @section.save
      redirect_to root_path, notice: 'Sessão criado com sucesso.'
    else
      flash.now[:alert] = 'Sessão não foi adicionada.'
      set_movies_rooms
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_movies_rooms
    @movies = Movie.all
    @rooms = Room.all
  end

  def section_params
    params.require(:section).permit(:time, :week_day, :movie_id, :room_id,)
  end
end