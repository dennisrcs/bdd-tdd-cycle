class FindMoviesWithSameDirectorController < ApplicationController

  def show
    @movie = Movie.find(params[:id])
    if @movie.director != nil && @movie.director != ""
      # list of similar movies but with the reference movie included
      @similar_movies = Movie.find_similar_movies(params[:id], @movie.director)
    else
      flash[:warning] = "'#{@movie.title}' has no director info"
      redirect_to '/'
    end
  end

end
