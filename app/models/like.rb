# == Schema Information
#
# Table name: likes
#
#  id               :integer          not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  fan_id           :integer
#  uploaded_file_id :integer
#
class Like < ApplicationRecord
  belongs_to :student, class_name: 'Student', foreign_key: 'fan_id'
  belongs_to :uploaded_file

  validates :student, presence: true
  validates :uploaded_file, presence: true
end
