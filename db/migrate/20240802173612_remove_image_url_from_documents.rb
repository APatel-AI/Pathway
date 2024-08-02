class RemoveImageUrlFromDocuments < ActiveRecord::Migration[7.1]
  def change
    remove_column :documents, :image_url, :string
  end
end
