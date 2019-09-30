module MicropostsHelper

 def current_micropost
     @micropost = Micropost.find(params[:id])
 end

end
