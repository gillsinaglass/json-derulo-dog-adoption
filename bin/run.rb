require_relative '../config/environment'
Qapi.get_breeds
input = gets.chomp
Zapi.get_pet_by_location(input)
# puts "\n\n\n\n\n\n"
#
cli = Cli.new

cli.ask_name

cli.login

cli.prompt_menu
