require 'active_record'
require 'rspec'
require 'pg'
require 'movie'
require 'customer'
require 'rating'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

RSpec.configure do |config|
  config.after(:each) do
    Movie.all.each { |movie| movie.destroy}
    Customer.all.each { |customer| customer.destroy}
    Rating.all.each { |rating| rating.destroy}
  end
end
