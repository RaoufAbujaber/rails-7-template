# == Schema Information
#
# Table name: uploaded_files
#
#  id         :integer          not null, primary key
#  course     :integer
#  file_path  :string
#  filename   :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UploadedFile < ApplicationRecord
  belongs_to :course, class_name: 'Course', foreign_key: 'course', optional: true
end
