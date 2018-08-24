class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  def create
    book = Book.find(params[:book_id])
    ApplicationRecord.transaction do
      @review = book.reviews.create(create_params)
      @review.published! if params[:commit] = '公開' # FIXME: buttonの日本語に依存しているのでよくない
    end
    redirect_to book_path(book.id)
    rescue => e
      render :text => e.message
  end

  def show
    @review = Review.find(params[:id])
  end

  private

  def create_params
    params.require(:review).permit(:title, :content).merge(user_id: current_user.id)
  end
end
