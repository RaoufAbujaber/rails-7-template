# == Schema Information
#
# Table name: students
#
#  id              :integer          not null, primary key
#  email           :string
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Student < ApplicationRecord
  has_many :enrollments, dependent: :destroy
  has_many :uploaded_files
  has_many :own_files, class_name: 'UploadedFile', foreign_key: 'student_id'
  has_many :likes, foreign_key: 'fan_id'

  validates(:username,
    {
      :presence => true,
      :uniqueness => { :case_sensitive => false }
    }
  )
  has_secure_password

end
