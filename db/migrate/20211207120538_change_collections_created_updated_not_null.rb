class ChangeCollectionsCreatedUpdatedNotNull < ActiveRecord::Migration[6.1]
  # def change
  #   change_column :collections, :created_at, :updated_at, :null => false
  # end
  def up
    change_column :collections, :created_at, :datetime
  end
  def down
    change_column :collections, :created_at, :datetime
  end
end
