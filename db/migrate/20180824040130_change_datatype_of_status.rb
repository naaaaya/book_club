class ChangeDatatypeOfStatus < ActiveRecord::Migration[5.0]
  def change
    change_column :reviews, :status, :integer, default: 0
  end
end
