require 'spec_helper'

describe Movie do
  it 'has many customers' do
    test_movie = Movie.create({:name => 'Star Wars'})
    test_customer1 = Customer.create({:name => 'Luke Skywalker', :movie_id => test_movie.id})
    test_customer2 = Customer.create({:name => 'Ben Kenobi', :movie_id => test_movie.id})
    expect(test_movie.customers).to eq [test_customer1, test_customer2]
  end

  it 'belongs to a rating' do
    test_rating = Rating.create({:name => 'PG13'})
    test_movie = Movie.create({:name => 'Star Wars', :rating_id => test_rating.id})
    expect(test_movie.rating).to eq test_rating
  end
end
