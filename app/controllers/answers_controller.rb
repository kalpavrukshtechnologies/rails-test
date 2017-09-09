class AnswersController < ApplicationController
  before_action :logged_in_user

  def create
    @answer = current_user.answers.build(answer_params)
    if @answer.save
      flash[:success] = "Answer is posted successfully!"
    else
      flash[:danger] = "Some error!"
    end
    redirect_to Question.find(answer_params[:question_id])
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :question_id)
  end
end
