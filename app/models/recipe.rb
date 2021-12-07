class Recipe < ApplicationRecord
  # ActiveStorage thumbnail for recipe
  has_one_attached :thumbnail
  belongs_to :user
  # One-to-many to Collections table
  has_many :collections
  has_many :collection_recipes, through: :collections, source: :user
end
