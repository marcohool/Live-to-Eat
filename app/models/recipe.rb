class Recipe < ApplicationRecord
  belongs_to :user
  has_many :collections
  has_many :collection_recipes, through: :collections, source: :user
end
