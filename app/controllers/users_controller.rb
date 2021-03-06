class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  
  def index
    @users = User.where(activated: true).paginate(page: params[:page]).search(params[:search])
    @tags = ActsAsTaggableOn::Tag.most_used(10)
  end
  
  def show
    @user = User.find(params[:id])
    redirect_to root_url and return unless @user.activated?
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      #success
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
    
  def update
    if @user.update_attributes(user_params)
      #更新に成功した場合を扱う。
      flash[:success] = "変更しました！"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
  
  def following
    @title = "フォローしているユーザー"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    @micropost = current_user.microposts.build
    @tags = ActsAsTaggableOn::Tag.most_used(10)
    render 'show_follow'
  end

  def followers
    @title = "フォロワー"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    @micropost = current_user.microposts.build
    @tags = ActsAsTaggableOn::Tag.most_used(10)
    render 'show_follow'
  end

  
  private
  # strong_parameters
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :image)
    end
    
# beforeアクション

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
   # 管理者かどうか確認
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
