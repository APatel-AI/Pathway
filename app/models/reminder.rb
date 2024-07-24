class Reminder < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"

end
