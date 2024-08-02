class RemoveImageUrlFromDependents < ActiveRecord::Migration[7.1]
  def change
    remove_column :dependents, :image_url, :string
  end
end
