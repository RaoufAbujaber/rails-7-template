class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :uploaded_file_id
      t.text :body
      t.integer :author_id

      t.timestamps
    end
  end
end
