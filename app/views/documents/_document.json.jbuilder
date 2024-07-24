json.extract! document, :id, :profile_id, :expiry_date, :summary, :status, :created_at, :updated_at
json.url document_url(document, format: :json)
