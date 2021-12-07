class CollectionController < ApplicationController
  # Authenticate user as they must be signed in to have a collection
  before_action :authenticate_user!

  def index
    @saved_recipes = current_user.recipes_in_collection
  end
end