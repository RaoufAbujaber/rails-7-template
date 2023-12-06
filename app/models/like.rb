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
  validates(:fan, { :presence => true })
  validates(:note, { :presence => true })

  def fan
    return User.where({ :id => self.fan_id }).at(0)
  end

  def note
    return Note.where({ :id => self.note_id }).at(0)
  end
end
