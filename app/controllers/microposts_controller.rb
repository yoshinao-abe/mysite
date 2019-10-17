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
        @tags = ActsAsTaggableOn::Tag.most_used(10)
        #@like = Like.new
    end
    
    def destroy
        @micropost.destroy
        flash[:success] = "投稿は削除されました"
        redirect_to request.referrer || root_url
    end
    
    def index
      @tags = ActsAsTaggableOn::Tag.most_used(10)
      @feed_tags  = current_user.feed.tagged_with(params[:tag]).paginate(page: params[:page])# ここをタグで引っ張ってくる
      @micropost  = Micropost.tagged_with(params[:tag])
      @feed_items = current_user.feed.paginate(page: params[:page])
        if params[:tag]
            @microposts = Micropost.tagged_with(params[:tag])
        else
            @microposts = Micropost.all
        end
    end
    
    def tags
        if params[:tag_name]
            @microposts = @microposts.tagged_with("#{params[:tag_name]}")
        end
    end
    
    def tagindex
       @tags = ActsAsTaggableOn::Tag.most_used.paginate(page: params[:page])
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
