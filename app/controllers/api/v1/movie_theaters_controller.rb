class Api::V1::MovieTheatersController < Api::V1::ApiController
  def rooms
    movie_theater = MovieTheater.find(params[:id])

    render json: movie_theater.as_json(
      except: [:updated_at, :created_at],
      include: {
        rooms: {
          only: [:name, :capacity]
        }
      }
    ), status: 200
  end
end