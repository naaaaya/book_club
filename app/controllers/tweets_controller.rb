class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @book = Book.find(params[:book_id])
    @tweets = @book.tweets.order("created_at DESC").limit(20)
    @tweet = @book.tweets.new
  end

  def create
    @book = Book.find(params[:book_id])
    @tweet = @book.tweets.create(create_params)
    redirect_to book_tweets_path
  end

  private

  def create_params
    params.require(:tweet).permit(:content).merge(user_id: current_user.id)
  end
end
