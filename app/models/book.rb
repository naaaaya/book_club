class Book < ApplicationRecord
  has_many :reviews
  belongs_to :user

  def publish
    book.update(is_published: true)
  end
end
