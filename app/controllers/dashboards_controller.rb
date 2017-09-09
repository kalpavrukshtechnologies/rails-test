class DashboardsController < ApplicationController
  def show
    @users = User.all
    @questions = Question.all
    @answers = Answer.all
  end
end
