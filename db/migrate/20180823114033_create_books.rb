class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps :created_at
    end
  end
end
