class Blog < ActiveForm
  column :title
  column :message, :type => :text
  
  validates_presence_of :title, :message
  
  def after_save
    client = Savon::Client.new "http://localhost:8080/"

    client.post! do |soap|
      soap.namespace = "urn:savon:blog"
      soap.body = to_hash
    end
  end
  
  def to_hash
    { :data => {:title=>title, :message=>message} }
  end
  
  
  def self.all
    client = Savon::Client.new "http://localhost:8080/"

    # read all blog posts
    response = client.index! do |soap|
      soap.namespace = "urn:savon:blog"
    end

    items = response.to_hash[:index_response][:return][:item]
    
    return [] if items.nil? or items.empty?

    # read the contents of all posts
    items.map do |item|
      client.get! do |soap|
        soap.namespace = "urn:savon:blog"
        soap.body = { :id => item}
      end
    end
  end
  
end