class Dog < ActiveRecord::Base
  validates_presence_of :name, :age
    
  def call_by_name(name)
    "guau" if name == self.name    
  end  
end
