require_relative '../config/environment'
cli = Cli.new # creates a new cli instance

cli.ask_name

input = cli.ask_location

Qapi.get_breeds

Zapi.get_pet_by_location(input)

cli.login

cli.prompt_menu
