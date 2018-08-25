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
      case params[:commit]
      when '下書き保存'
        @review.draft!
      when '公開'
        @review.published!
      end # FIXME: buttonの日本語に依存しているのでよくない
    end
    redirect_to book_path(book.id)
    rescue => e
      render :text => e.message
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
    @book = @review.book
  end

  def update
    @review = Review.find(params[:id])
    ApplicationRecord.transaction do
      @review.update(update_params)
      case params[:commit]
      when '下書き保存'
        @review.draft!
      when '公開'
        @review.published!
      when '非公開'
        @review.archived!
      end
    end
    redirect_to book_path(@review.book.id)
    rescue => e
      render :text => e.message
  end

  private

  def create_params
    params.require(:review).permit(:title, :content).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:review).permit(:title, :content)
  end
end
