require_relative '../config/environment'
cli = Cli.new

Qapi.get_breeds


cli.ask_name

input = cli.ask_location

Zapi.get_pet_by_location(input)

cli.login

cli.prompt_menu
