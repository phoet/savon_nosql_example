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
  
end