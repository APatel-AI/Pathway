# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 20_240_815_123_509) do
  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum'
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', force: :cascade do |t|
    t.bigint 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index %w[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'blazer_audits', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'query_id'
    t.text 'statement'
    t.string 'data_source'
    t.datetime 'created_at'
    t.index ['query_id'], name: 'index_blazer_audits_on_query_id'
    t.index ['user_id'], name: 'index_blazer_audits_on_user_id'
  end

  create_table 'blazer_checks', force: :cascade do |t|
    t.integer 'creator_id'
    t.integer 'query_id'
    t.string 'state'
    t.string 'schedule'
    t.text 'emails'
    t.text 'slack_channels'
    t.string 'check_type'
    t.text 'message'
    t.datetime 'last_run_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['creator_id'], name: 'index_blazer_checks_on_creator_id'
    t.index ['query_id'], name: 'index_blazer_checks_on_query_id'
  end

  create_table 'blazer_dashboard_queries', force: :cascade do |t|
    t.integer 'dashboard_id'
    t.integer 'query_id'
    t.integer 'position'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['dashboard_id'], name: 'index_blazer_dashboard_queries_on_dashboard_id'
    t.index ['query_id'], name: 'index_blazer_dashboard_queries_on_query_id'
  end

  create_table 'blazer_dashboards', force: :cascade do |t|
    t.integer 'creator_id'
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['creator_id'], name: 'index_blazer_dashboards_on_creator_id'
  end

  create_table 'blazer_queries', force: :cascade do |t|
    t.integer 'creator_id'
    t.string 'name'
    t.text 'description'
    t.text 'statement'
    t.string 'data_source'
    t.string 'status'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['creator_id'], name: 'index_blazer_queries_on_creator_id'
  end

  create_table 'dependents', force: :cascade do |t|
    t.integer 'user_id'
    t.text 'address'
    t.string 'relationship'
    t.string 'first_name'
    t.string 'last_name'
    t.text 'date_of_birth'
    t.string 'immigration_status'
    t.string 'country_of_citizenship'
    t.text 'contact_info'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.text 'notes'
  end

  create_table 'documents', force: :cascade do |t|
    t.integer 'profile_id'
    t.datetime 'expiry_date'
    t.string 'summary'
    t.string 'status'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'name'
  end

  create_table 'reminders', force: :cascade do |t|
    t.integer 'user_id'
    t.datetime 'send_at'
    t.text 'message'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.string 'username'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
end
