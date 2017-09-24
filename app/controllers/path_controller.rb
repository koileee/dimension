class PathController < ApplicationController
  before_action :load_user

  def index
  end

  def paths
    unless @user
      redirect_to url_for(:controller => :users, :action => :login)
    end
  end

  def data_center
  end

  def show_eric
    @parsed_csv = csv_parse("HR_comma_sep.csv")
  end

  private

  def csv_parse(csv_file)
    require 'csv'

    parsed_csv = []
    csv_text = File.read(Rails.root.join("public", csv_file))
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      parsed_csv << row.to_hash
    end
    parsed_csv
  end

  def load_user
    @user = User.find_by_id(session[:current_user_id])
  end
end
