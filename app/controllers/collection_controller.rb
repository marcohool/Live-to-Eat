class CollectionController < ApplicationController
 before_action :authenticate_user!

  def index
    @saved_recipes = current_user.recipes_in_collection
  end
end