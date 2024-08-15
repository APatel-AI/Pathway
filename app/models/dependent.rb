# == Schema Information
#
# Table name: dependents
#
#  id                     :integer          not null, primary key
#  address                :text
#  contact_info           :text
#  country_of_citizenship :string
#  date_of_birth          :text
#  first_name             :string
#  immigration_status     :string
#  last_name              :string
#  notes                  :text
#  relationship           :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  user_id                :integer
#
class Dependent < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  has_many  :documents, class_name: "Document", foreign_key: "profile_id", dependent: :destroy
  has_one_attached :image
  validates :notes, length: { maximum: 500 }

end
