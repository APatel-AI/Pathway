# frozen_string_literal: true

json.extract! reminder, :id, :user_id, :send_at, :message, :created_at, :updated_at
json.url reminder_url(reminder, format: :json)
