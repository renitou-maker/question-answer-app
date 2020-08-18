class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index,:edit,:update,:destroy,:show]
  before_action :correct_user, only: [:edit,:update]
  
  def new
    @user = User.new
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @questions = @user.questions.paginate(page: params[:page])
  end

  def edit
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user 
      flash[:success] = "QuestionAPPへようこそ！"
      redirect_to @user 
    else
      render 'new'
    end
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "ユーザー情報を編集しました"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーが削除されました"
    redirect_to users_url
  end
  
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
  
end
