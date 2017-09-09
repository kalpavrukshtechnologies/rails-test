class WelcomeController < ApplicationController
  before_action :not_logged_in_user
  def index
    
  end
end
