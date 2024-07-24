class CreateReminders < ActiveRecord::Migration[7.1]
  def change
    create_table :reminders do |t|
      t.integer :user_id
      t.datetime :send_at
      t.text :message

      t.timestamps
    end
  end
end
