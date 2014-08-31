require 'active_record'
require './lib/movie'
require './lib/customer'
require './lib/rating'

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
  puts "[a] Add a movie for the current movie listing"
  puts "[l] List all movies in the current movie listing"
  puts "[d] Remove a movie from the current movie listing"
  puts "[c] Add a new customer for the current day"
  puts "[v] View all customers and what movie they saw for the current day"
  puts "[s] Search for a movie and see how many customers came to see it"
  puts "[w] Return to the welcome menu"
  menu_choice = gets.chomp.downcase
  if menu_choice == 'a'
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
welcome
