require_relative '../config/environment'

Qapi.get_breeds
# puts "\n\n\n\n\n\n"
#
cli = Cli.new

cli.ask_name

cli.login

cli.prompt_menu
# url = "https://api.thedogapi.com/v1/breeds?"
# uri = URI.parse(url)
# request = Net::HTTP::Get.new(uri)
# request["Accept"] = "application/json"
#
# req_options = {
#   use_ssl: uri.scheme == "https",
# }
#
# response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
#   http.request(request)
# end
# json = JSON.parse(response.body)
# binding.pry
# 0
