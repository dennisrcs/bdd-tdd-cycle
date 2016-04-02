require 'spec_helper'

describe FindMoviesWithSameDirectorController do
  fixtures :movies
 
  describe 'a RESTful route for Find Similar Movies' do
    it "should render the Find With Same Director page" do
      movie = movies(:milk_movie)
      get "show", :id => movie.id
      response.should be_success
    end
  end
 
  describe 'click on Find With Same Director' do
    it 'should receive the click on "Find With Same Director", and grab the id of the movie' do
      movie = movies(:milk_movie)
      get "show", :id => movie.id
      @controller.params[:id].should eql movie.id.to_s  
    end
  end

  describe 'model method in the Movie model to find movies whose director matches that of the current movie' do
    it 'should the Movie model method for finding similar movies' do
      movie = movies(:milk_movie)
      fake_return = [movies(:lotr_movie), movies(:matrix_movie)]
      get "show", :id => movie.id
      assigns(:similar_movies).should == fake_return
    end
  end

end
