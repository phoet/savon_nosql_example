require 'savon'

client = Savon::Client.new "http://localhost:8080/"

client.add! do |soap|
  # soap.action = "add"
  # soap.input = "GetUserByIdRequest"
  soap.namespace = "urn:ruby:calculation"
  soap.body = { :a => 20, :b => 30 }
end