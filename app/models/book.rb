class Book < ApplicationRecord
  has_many :reviews
  has_many :tweets
  belongs_to :user

  def publish
    book.update(is_published: true)
  end
end
