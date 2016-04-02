class Movie < ActiveRecord::Base

  attr_accessible :title, :rating, :director, :description, :release_date

  def self.find_similar_movies(id, director)
    similar_movies_plus_one = Movie.where(:director => director)

    # list of movies that will be used in the view
    similar_movies = []

    # filtering according to the reference movie
    similar_movies_plus_one.each do |mv|
      if mv.id.to_s != id
        similar_movies << mv
      end
    end

    return similar_movies
  end

  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
end

