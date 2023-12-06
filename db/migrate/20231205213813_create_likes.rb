class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :fan_id
      t.integer :uploaded_file_id

      t.timestamps
    end
  end
end
