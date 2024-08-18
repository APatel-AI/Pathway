# frozen_string_literal: true

class CreateDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :documents do |t|
      t.integer :profile_id
      t.datetime :expiry_date
      t.string :summary
      t.string :status

      t.timestamps
    end
  end
end
