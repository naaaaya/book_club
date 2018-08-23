class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.integer :status, default: 0
      t.integer :user_id, null: false
      t.integer :book_id, null: false
      t.timestamps
    end
  end
end
