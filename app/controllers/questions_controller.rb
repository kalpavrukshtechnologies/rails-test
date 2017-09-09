class QuestionsController < ApplicationController
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
