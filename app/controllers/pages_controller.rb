class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @lists = Lists.all
  end
end
