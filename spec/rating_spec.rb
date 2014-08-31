require 'spec_helper'

describe Rating do
  it 'has many movies' do
    test_rating = Rating.create({:name => 'PG13'})
    test_movie1 = Movie.create({:name => 'Star Wars', :rating_id => test_rating.id})
    test_movie2 = Movie.create({:name => 'The Avengers', :rating_id => test_rating.id})
    expect(test_rating.movies).to eq [test_movie1, test_movie2]
  end

  it 'validates the presence of name' do
    test_rating = Rating.new({:name => 'PG13'})
    expect(test_rating.save).to eq true
  end
end
