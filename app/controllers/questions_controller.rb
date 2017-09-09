class QuestionsController < ApplicationController
  before_action :logged_in_user

  def index
    @questions = Question.all
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answer = Answer.new
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      flash[:success] = "Question is posted successfully!"
    else
      flash[:danger] = "Some error!"
    end
    redirect_to current_user
  end

  private

  def question_params
    params.require(:question).permit(:title, :private)
  end
end
