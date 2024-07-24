json.extract! dependent, :id, :user_id, :image_url, :address, :relationship, :first_name, :last_name, :date_of_birth, :immigration_status, :country_of_citizenship, :contact_info, :created_at, :updated_at
json.url dependent_url(dependent, format: :json)
