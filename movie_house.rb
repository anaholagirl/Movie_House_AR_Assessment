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
welcome
