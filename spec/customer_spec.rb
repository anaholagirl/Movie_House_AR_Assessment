require 'spec_helper'

describe Customer do
  it 'belongs to a movie' do
    test_movie = Movie.create({:name => "Star Trek"})
    test_customer = Customer.create({:name => "Captain Picard", :movie_id => test_movie.id})
    expect(test_customer.movie).to eq test_movie
  end
end
