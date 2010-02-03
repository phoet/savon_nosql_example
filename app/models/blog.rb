class Blog < ActiveForm
  column :title
  column :message, :type => :text
  
  validates_presence_of :title, :message
end