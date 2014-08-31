require 'spec_helper'

describe Movie do
  it 'has many customers' do
    test_movie = Movie.create({:name => 'Star Wars'})
    test_customer1 = Customer.create({:name => 'Luke Skywalker', :movie_id => test_movie.id})
    test_customer2 = Customer.create({:name => 'Ben Kenobi', :movie_id => test_movie.id})
    expect(test_movie.customers).to eq [test_customer1, test_customer2]
  end
end
