class UsersController < ApplicationController
  before_action :load_user, :except => [:new, :create, :validate_login]

  def new
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    if @user
      flash[:error] = "Username Already Exists"
      redirect_to request.env["HTTP_REFERER"]
    else
      @user = User.new
      @user.update_attributes(email: params[:user][:email], password: params[:user][:password], fname: params[:user][:fname], lname: params[:user][:lname])
      if @user.save
        flash[:notice] = "created"
        session[:current_user_id] = @user.id
      else
        flash[:error] = "error"
      end
      redirect_to url_for(:controller => :path, :action => :path)
    end
  end

  def login
    redirect_to url_for(:controller => :path, :action => :path) if @user
    # field for will fill the values
  end

  def validate_login
    @user = User.find_by_email(params[:user][:email])
    if @user
      if @user.password == params[:user][:password]
        flash[:notice] = "Logged In"
        session[:current_user_id] = @user.id
        redirect_to url_for(:controller => :path, :action => :path)
      else
        flash[:error] = "Incorrect Password"
        redirect_to request.env["HTTP_REFERER"]
      end
    else
      flash[:error] = "Incorrect Username"
      redirect_to request.env["HTTP_REFERER"]
    end
  end

  def logout
    @user = nil
    session[:current_user_id] = nil
    redirect_to :root
  end

  def show
    return if @user
    flash[:error] = "Please login."
    redirect_to :login_users
  end

  def change_password
    if @user.password == params[:password] && params[:rep_password] == params[:new_password]
      @user.password = params[:password]
      if @user.save
        flash[:notice] = "Password changed."
      else
        flash[:error] = "Failed to change the password."
      end
    else
      flash[:error] = "Incorrect password."
    end
    redirect_to :back
  end

  private

  def load_user
    @user = User.find_by_id(session[:current_user_id])
  end
end
