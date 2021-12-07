class Collection < ApplicationRecord
  # Join table between a user and a recipe they want to save
  belongs_to :user
  belongs_to :recipe
  validates :user_id, uniqueness: { scope: :recipe_id }
end
