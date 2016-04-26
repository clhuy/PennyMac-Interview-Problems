# using the rubillow gem
require 'rubygems'
require 'rubillow'

# setting the Zillow Web Services Identification
Rubillow.configure do |configuration|
  configuration.zwsid = "X1-ZWz1f97vnpw4qz_a57uf"
end

# command line arguments
address = ARGV[0]
citystatezip = ARGV[1]

# API request
data = Rubillow::HomeValuation.search_results({:address => address, :citystatezip => citystatezip})

if data.success?
  puts "Zillow's estimated market value: $#{data.price}"
end




