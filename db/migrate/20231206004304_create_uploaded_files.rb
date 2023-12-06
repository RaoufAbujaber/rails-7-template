class CreateUploadedFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :uploaded_files do |t|
      t.string :filename
      t.string :file_path
      t.string :username
      t.integer :course

      t.timestamps
    end
  end
end
