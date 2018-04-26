class AddCategoryToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_reference :documents, :category, foreign_key: true
  end
end
