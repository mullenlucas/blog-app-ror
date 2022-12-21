class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  def current_user
    User.find(params[:user_id])
  end
end
