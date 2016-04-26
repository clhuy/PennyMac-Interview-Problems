require 'rubygems'
require 'rubillow'
require 'sinatra'

# setting the Zillow Web Services Identification
Rubillow.configure do |configuration|
  configuration.zwsid = "X1-ZWz1f97vnpw4qz_a57uf"
end

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"

get '/zestimate/' do
    erb :form
end

post '/zestimate/' do
    address = params[:address]
    citystatezip = params[:citystatezip]
    data = Rubillow::HomeValuation.search_results({:address => address, :citystatezip => citystatezip})

    erb :index, :locals => {'zestimate' => data.price}
end





