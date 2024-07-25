# == Schema Information
#
# Table name: documents
#
#  id          :integer          not null, primary key
#  expiry_date :datetime
#  status      :string
#  summary     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  profile_id  :integer
#
class Document < ApplicationRecord
  belongs_to :dependent, required: true, class_name: "Dependent", foreign_key: "profile_id"

end
