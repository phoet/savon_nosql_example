require 'savon'

client = Savon::Client.new "http://localhost:8080/"

client.post! do |soap|
  soap.namespace = "urn:savon:blog"
  soap.body = { :data => {:title=>'some title', :message=>'message\nmultiline'}}
end