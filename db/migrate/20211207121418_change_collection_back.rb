class ChangeCollectionBack < ActiveRecord::Migration[6.1]
  def change
    change_column :collections, :created_at, :datetime
  end
end
