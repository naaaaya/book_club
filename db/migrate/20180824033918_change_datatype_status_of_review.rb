class ChangeDatatypeStatusOfReview < ActiveRecord::Migration[5.0]
  def change
    change_column :reviews, :status, :boolean
  end
end
