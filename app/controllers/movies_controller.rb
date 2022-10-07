class MoviesController < ApplicationController
  def index
    movies = Movie.joins(:user, :genre, :category).select('movies.*, user, genres as genre')
    render json: movies.to_json
  end

  def show
    movie = Movie.joins(:user, :genre,
                        :category).select('movies.*, user, genres as genre').where(movies: { id: params[:id] })
    render json: movie.to_json
  end

  def create
    movie = Movie.new(movie_params)
    movie.user = current_user
    if movie.save
      render json: movie, status: 200
    else
      render json: { error: 'Error creating a movie' }
    end
  end

  def destroy
    movie = Movie.find(params[:id])
    if movie.destroy
      render json: { message: 'Movie deleted successfully!' }, status: 200
    else
      render json: { error: 'Error deleting a movie' }
    end
  end

  def latest_movie
    movies = Movie.joins(:user, :genre,
                         :category).select('movies.*, user, genres as genre').order('movies.created_at desc').limit(3)
    render json: movies.to_json
  end

  def movie_params
    params.require(:movie).permit(:title, :picture, :category_id, :genre_id)
  end
end
