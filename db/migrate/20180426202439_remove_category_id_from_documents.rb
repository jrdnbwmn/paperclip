class RemoveCategoryIdFromDocuments < ActiveRecord::Migration[5.2]
  def change
    remove_column :documents, :category_id, :integer
  end
end
