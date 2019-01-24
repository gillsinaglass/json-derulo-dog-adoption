require_relative '../config/environment'

Qapi.get_breeds
Breed.create_groups
# puts "\n\n\n\n\n\n"
#
cli = Cli.new

cli.ask_name

cli.login

cli.prompt_menu
