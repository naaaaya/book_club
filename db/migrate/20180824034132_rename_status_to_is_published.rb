class RenameStatusToIsPublished < ActiveRecord::Migration[5.0]
  def change
    rename_column :reviews, :status, :is_published
  end
end
