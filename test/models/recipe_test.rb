require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  test "should not save empty recipe" do
    recipe = Recipe.new

    recipe.save
    refute recipe.valid?
  end

  test "should save valid recipe from logged in user" do
    @user = users(:one)
    sign_in users(:one)

    recipe = @user.recipes.build
    recipe.title = "Recipe 1"
    recipe.author = "Recipe Author"

    recipe.save
    assert recipe.valid?
  end
end
