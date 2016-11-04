require "yelp"
require "sinatra"
require "dotenv"

Dotenv.load

get "/" do
  erb :index
end

post "/restaurants" do
  client = Yelp::Client.new({
    consumer_key:    ENV["YELP_CONSUMER_KEY"],
    consumer_secret: ENV["YELP_CONSUMER_SECRET"],
    token:           ENV["YELP_TOKEN"],
    token_secret:    ENV["YELP_TOKEN_SECRET"]
  })

  search_params = { term: params[:cuisine_type], limit: 10 }
  city_name = params[:location]

  response = client.search(city_name, search_params)

  @random_selection = response.businesses.sample
  puts @random_selection.name
  puts @random_selection.rating
  puts @random_selection.location.display_address

  erb "<%= [ @random_selection.name, @random_selection.rating, @random_selection.location.display_address ] %>"
end
