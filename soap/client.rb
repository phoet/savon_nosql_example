require 'savon'

client = Savon::Client.new "http://localhost:8080/"

# add a blog post
client.post! do |soap|
  soap.namespace = "urn:savon:blog"
  soap.body = { :data => {:title=>"some title", :message=>"some message at #{Time.now}"}}
end

# read all blog posts
response = client.index! do |soap|
  soap.namespace = "urn:savon:blog"
end

# read the contents of all posts
response.to_hash[:index_response][:return][:item].each do |item|
  client.get! do |soap|
    soap.namespace = "urn:savon:blog"
    soap.body = { :id => item}
  end
end
