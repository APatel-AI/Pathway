class AddNameToDocuments < ActiveRecord::Migration[7.1]
  def change
    add_column :documents, :name, :string
  end
end
