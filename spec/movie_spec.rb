require 'spec_helper'
require 'pry'

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

  it 'validates presence of name' do
    test_movie = Movie.new({:name => 'Star Wars'})
    expect(test_movie.save).to eq true
  end

  it 'finds all the movies that are not suitable for children' do
    test_rating1 = Rating.create({:name => 'R'})
    test_rating2 = Rating.create({:name => 'PG13'})
    test_movie1 = Movie.create({:name => 'The Matrix', :rating_id => test_rating1.id})
    test_movie2 = Movie.create({:name => 'Star Wars', :rating_id => test_rating2.id})
    test_movie3 = Movie.create({:name => 'Looper', :rating_id => test_rating1.id})
    expect(Movie.unsuitable).to eq [test_movie1, test_movie3]
  end
end
