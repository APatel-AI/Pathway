class CreateDependents < ActiveRecord::Migration[7.1]
  def change
    create_table :dependents do |t|
      t.integer :user_id
      t.string :image_url
      t.text :address
      t.string :relationship
      t.string :first_name
      t.string :last_name
      t.text :date_of_birth
      t.string :immigration_status
      t.string :country_of_citizenship
      t.text :contact_info

      t.timestamps
    end
  end
end
