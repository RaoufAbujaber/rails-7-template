# == Schema Information
#
# Table name: courses
#
#  id            :integer          not null, primary key
#  term_offered  :string
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  department_id :integer
#
class Course < ApplicationRecord
  has_many :enrollments, dependent: :destroy
  has_many :uploaded_files
end
