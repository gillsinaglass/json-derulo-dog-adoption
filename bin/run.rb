require_relative '../config/environment'


puts "\n\n\n\n\n\n"

cli = Cli.new

cli.ask_name

cli.login

cli.prompt_menu
