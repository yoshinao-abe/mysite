class StaticPagesController < ApplicationController
  def home
  end

  def help
  end
  
  def about
    
  end
  
  def contact
  end
  
  class User
    attr_accessor :name, :email
    
   def initialize(attributes = {})
     @name  = attributes[:name]
     @email = attributes[:email]
   end
   
   def formatted_email
     "#{@name} <#{@email}>"
   end
  end
  
end
