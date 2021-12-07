class ChangeCollectionsToNullable < ActiveRecord::Migration[6.1]
  def change
    change_column_null :collections, :created_at, true
    change_column_null :collections, :updated_at, true
  end
end
