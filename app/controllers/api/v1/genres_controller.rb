class Api::V1::GenresController < ApplicationController
  def index
    genres = Genre.all
    render json: genres
  end
end