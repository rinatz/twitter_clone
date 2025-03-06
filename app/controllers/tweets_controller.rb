class TweetsController < ApplicationController
  before_action :set_user

  def index
    @tweets = Tweet.includes(:user).order(created_at: :desc)
    @new_tweet = Tweet.new
  end

  def create
    Tweet.create!(content: params[:tweet][:content], user: @user)
    redirect_to root_path, notice: "ツイートしました！"
  end

  private

  def set_user
    @user = User.find_by(name: params[:name])
  end
end
