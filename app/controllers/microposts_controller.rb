class MicropostsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user, only: :destroy
    
    def create
        @micropost = current_user.microposts.build(micropost_params)
        if @micropost.save
            flash[:success] = "投稿しました！"
            redirect_to root_url
        else
            flash[:danger] = "あら、投稿に失敗しました．．．"
            @feed_items = current_user.feed.paginate(page: params[:page])
            redirect_to root_url
        end
    end
    
    def show
        @micropost = Micropost.find(params[:id])
        #@like = Like.new
    end
    
    def destroy
        @micropost.destroy
        flash[:success] = "投稿は削除されました"
        redirect_to request.referrer || root_url
    end
    
    def index
        if params[:tag]
            @microposts = Micropost.tagged_with(params[:tag])
        else
            @microposts = Micropost.all
        end
        
#        if params[:tag_name]
 #           @microposts = @microposts.tagged_with("#{params[:tag_name]}")
  #      end
    end
    
    def tags
        if params[:tag_name]
            @microposts = @microposts.tagged_with("#{params[:tag_name]}")
        end
    end
 private

    def micropost_params
      params.require(:micropost).permit(:content, :picture, :tag_list, :game_list, :category_list)
    end
    
    def correct_user
        @micropost = current_user.microposts.find_by(id: params[:id])
        redirect_to root_url if @micropost.nil?
    end
end
