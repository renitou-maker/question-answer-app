class QuestionsController < ApplicationController
  before_action :logged_in_user, only: [:create,:destroy,:new,:edit]

  def new
    @question = current_user.questions.build if logged_in?
  end

  def index
    @questions = Question.paginate(page: params[:page])
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def edit
    @question = Question.find(params[:id])
  end
  
  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:success] = "質問内容を更新しました"
      redirect_to question_path(@question)
    else
      render 'questions/edit'
    end
  end
  
  def create
    @question = current_user.questions.build(question_params)
    @question.image.attach(params[:question][:image])
    if @question.save
      flash[:success] = "質問が作成されました"
      redirect_to root_url
    else
      render 'questions/new'
    end
  end
  
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:success] = "質問が削除されました"
    redirect_to root_url
  end
  
  private
    
    def question_params
      params.require(:question).permit(:title,:content,:image)
    end
  
end
