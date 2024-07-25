# == Schema Information
#
# Table name: reminders
#
#  id         :integer          not null, primary key
#  message    :text
#  send_at    :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Reminder < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"

end
