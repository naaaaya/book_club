class RenameIsPublishedToStatus < ActiveRecord::Migration[5.0]
  def change
    rename_column :reviews, :is_published, :status
  end
end
