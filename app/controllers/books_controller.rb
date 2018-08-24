class BooksController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(create_params)
    redirect_to action: 'index'
  end

  def show
    @book = Book.find(params[:id])
    @reviews = @book.reviews.includes(:user)
  end

  private

  def create_params
    params.require(:book).permit(:title, :author, :start_date, :end_date).merge(user_id: current_user.id)
  end
end
