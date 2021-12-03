class CreateCollections < ActiveRecord::Migration[6.1]
  def change
    create_table :collections do |t|
      t.integer :recipe_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
