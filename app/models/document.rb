class Document < ApplicationRecord
  belongs_to :profile, required: true, class_name: "Dependent", foreign_key: "profile_id"

end
