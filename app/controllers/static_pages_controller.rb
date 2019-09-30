class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      @feed_tags  = current_user.feed.paginate(page: params[:page])
    else
      @feed_items = []
    end
  end

  def help
  end
  
  def about
    
  end
  
  def contact
  end
  
  def signup
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
