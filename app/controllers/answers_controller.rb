class AnswersController < ApplicationController
  before_action :logged_in_user, only: [:create,:destroy,:edit]
  
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    if @answer.save
      flash[:success] = "回答が投稿されました"
      redirect_to question_path(@question)
    else
      render 'questions/show'
    end
  end
  
  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    if @answer.destroy
      redirect_to question_path(@question)
    end
  end
  
  private
  
    def answer_params
      params.require(:answer).permit(:content,:question_id)
    end
  
end
