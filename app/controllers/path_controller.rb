class PathController < ApplicationController
  before_action :load_user

  def index
  end

  def path
    unless @user
      redirect_to url_for(:controller => :users, :action => :login)
    end
  end

  private
  def load_user
    @user = User.find_by_id(session[:current_user_id])
  end
end
