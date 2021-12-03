class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.text :description
      t.text :method
      t.integer :prep
      t.integer :cooking_time
      t.string :author, null: false

      t.timestamps
    end
  end
end
