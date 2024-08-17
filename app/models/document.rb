# == Schema Information
#
# Table name: documents
#
#  id          :integer          not null, primary key
#  expiry_date :datetime
#  name        :string
#  status      :string
#  summary     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  profile_id  :integer
#
class Document < ApplicationRecord
  belongs_to :dependent, required: true, class_name: "Dependent", foreign_key: "profile_id"
  validates :file, presence: true, allow_nil: true
  validates :name, presence: true

  has_one_attached :file

  scope :with_file_attachment, -> { includes(:file_attachment) }


  private

  validate :correct_file_format

  def correct_file_format
    if file.attached? && !file.content_type.in?(%w(application/pdf image/jpeg image/png))
      errors.add(:file, 'must be a PDF, JPG, or PNG')
    end
  end



end
