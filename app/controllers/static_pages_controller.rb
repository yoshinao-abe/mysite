class StaticPagesController < ApplicationController
  def home
      @tags = ActsAsTaggableOn::Tag.most_used(10)
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      @feed_tags  = current_user.feed.tagged_with(params[:tag]).paginate(page: params[:page])# ここをタグで引っ張ってくる
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
