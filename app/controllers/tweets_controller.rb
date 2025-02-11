class TweetsController < ApplicationController
  def index
    @tweets = Tweet.includes(:user).order(created_at: :desc)
    @alice = User.find_by(name: "Alice")  # Aliceのアカウント取得
    @new_tweet = Tweet.new
  end

  def create
    alice = User.find_by(name: "Alice")
    Tweet.create!(content: params[:tweet][:content], user: alice)
    redirect_to root_path, notice: "ツイートしました！"
  end
end
