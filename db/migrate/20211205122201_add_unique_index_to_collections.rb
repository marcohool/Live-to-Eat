class AddUniqueIndexToCollections < ActiveRecord::Migration[6.1]
  def change
    add_index :collections, [:user_id, :recipe_id], unique: true
  end
end
