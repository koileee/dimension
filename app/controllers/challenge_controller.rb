class ChallengeController < ApplicationController
  def new
  end

  def create
    @challenge = Challenge.new
    @user.update_attributes(params[:challenge])
    @user.save
  end
end
