class Blog < ActiveForm
  column :title
  column :message, :type => :text
  
  validates_presence_of :title, :message
  
  def after_save
    puts "after save #{self}"
  end
end