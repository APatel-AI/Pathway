# frozen_string_literal: true

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
  has_many :documents, class_name: "Document", foreign_key: "profile_id", dependent: :destroy
  has_one_attached :image

  validates :notes, length: { maximum: 500 }
  validates :first_name, :last_name, :date_of_birth, :country_of_citizenship, :relationship, :immigration_status, presence: true
  validates :first_name, :last_name, length: { maximum: 50 }
  validates :date_of_birth, format: { with: /\A\d{4}-\d{2}-\d{2}\z/, message: "must be in the format YYYY-MM-DD" }
  validates :notes, length: { maximum: 500 }
  
end
