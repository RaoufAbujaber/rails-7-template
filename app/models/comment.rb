# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  body             :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  author_id        :integer
#  uploaded_file_id :integer
#

class Comment < ApplicationRecord
  validates :author_id, presence: true
  validates :uploaded_file_id, presence: true
  validates :body, presence: true

  belongs_to :uploaded_file, class_name: 'UploadedFile', foreign_key: 'uploaded_file_id'

  belongs_to :commenter, class_name: 'Student', foreign_key: 'author_id'

end
