class AddImageUrlToDocuments < ActiveRecord::Migration[7.1]
  def change
    add_column :documents, :image_url, :string
  end
end
