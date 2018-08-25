class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user
  enum status: {draft: 0, published: 1}
  validates :user_id, uniqueness: {scope: :book_id}
end
