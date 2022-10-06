class MoviesController < ApplicationController
  def index
    movies = Movie.joins(:user, :genre, :category).select("movies.*, user, genres as genre")
    render json: movies.to_json
  end

  def show
    movie = Movie.joins(:user, :genre, :category).select("movies.*, user, genres as genre").where(movies: {id: params[:id]})
    render json: movie.to_json 
  end

  def new
    @movie = Movie.new
  end

  def create
  end

  def destroy
  end
end