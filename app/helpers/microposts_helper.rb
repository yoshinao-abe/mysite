module MicropostsHelper
 include ActsAsTaggableOn::TagsHelper
 
 def current_micropost
     @micropost = Micropost.find(params[:id])
 end

end
