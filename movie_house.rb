require 'active_record'
require './lib/movie'
require './lib/customer'
require './lib/rating'
require 'pry'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def welcome
  system('clear')
  puts "\nWelcome to the Movie House where all your favorite movies are playing!\n"
  puts "\nPress the corresponding letter to select choice.\n\n"
  puts "[m] Go to the main menu"
  puts "[x] Exit the system"
  menu_choice = gets.chomp.downcase
  if menu_choice == 'm'
    main_menu
  elsif menu_choice == 'x'
    puts "Thank you and Good-Bye!"
    exit
  else
    puts "Please enter a valid option"
  end
end

def main_menu
  puts "\n\n******** MAIN MENU ********\n\n"
  puts "Press the corresponding letter to select choice\n\n"
  puts "[r] Add a rating into the system"
  puts "[a] Add a movie for the current movie listing"
  puts "[l] List all movies in the current movie listing"
  puts "[d] Remove a movie from the current movie listing"
  puts "[c] Add a new customer for the current day"
  puts "[v] View all customers and what movie they saw for the current day"
  puts "[s] Search for a movie and see how many customers came to see it"
  puts "[w] Return to the welcome menu"
  menu_choice = gets.chomp.downcase
  if menu_choice == 'r'
    add_rating
  elsif menu_choice == 'a'
    add_movie
  elsif menu_choice == 'l'
    list_movies
  elsif menu_choice == 'd'
    delete_movie
  elsif menu_choice == 'c'
    add_customer
  elsif menu_choice == 'v'
    list_customers
  elsif menu_choice == 's'
    search_movie
  elsif menu_choice == 'w'
    welcome
  else
    puts "Please enter a valid option"
    main_menu
  end
end

def add_rating
  puts "\n\nWhat is the rating that you would like to add?\n\n"
  rating_name = gets.chomp
  new_rating = Rating.create({:name => rating_name})
  if new_rating.save
    puts "\n'#{new_rating.name}' has been added to the system"
  else
    puts "That wasn't a valid rating name"
  end
  main_menu
end

def add_movie
  puts "What is the name of the movie you would like to add?"
  movie_name = gets.chomp
  puts "Here is a list of the different ratings in the system\n\n"
  Rating.all.each { |rating| puts rating.name}
  puts "What is the rating of this movie?"
  rating_name = gets.chomp
  rating_choice = Rating.where({:name => rating_name}).first
  new_movie = Movie.create({:name => movie_name, :rating_id => rating_choice.id})
  if new_movie.save
    puts "\n\n'#{new_movie.name}' has been added to the current movie listing!\n\n"
  else
    puts "That wasn't a valid movie name"
  end
  main_menu
end

def list_movies
  puts "\n\nHere is a list of all the movies in the current movie listing \n\n"
  Movie.all.each {|movie| puts movie.name}
  puts "\nBe careful! These movies are not suitable for children!\n\n"
  Movie.unsuitable.each { |movie| puts movie.name }
  main_menu
end
welcome
