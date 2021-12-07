require "test_helper"

class RecipesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe = recipes(:one)
  end

  test "should get index" do
    get recipes_url
    assert_response :success
  end

  test "should get new when signed in" do
    sign_in users(:one)
    get new_recipe_url
    assert_response :success
  end

  test "should redirect to sign in when get new and not signed in in" do
    get new_recipe_url
    assert_redirected_to new_user_session_url
  end

  test "should create recipe when signed in" do
    sign_in users(:one)
    assert_difference('Recipe.count') do
      post recipes_url, params: { recipe: { author: @recipe.author, cooking_time: @recipe.cooking_time, description: @recipe.description, method: @recipe.method, prep: @recipe.prep, title: @recipe.title } }
    end
  end

  test "should not create recipe when not signed in" do
    assert_no_difference('Recipe.count') do
      post recipes_url, params: { recipe: { author: @recipe.author, cooking_time: @recipe.cooking_time, description: @recipe.description, method: @recipe.method, prep: @recipe.prep, title: @recipe.title } }
    end
  end

  test "should show recipe" do
    get recipe_url(@recipe)
    assert_response :success
  end

  test "should get edit if signed in" do
    sign_in users(:one)
    get edit_recipe_url(@recipe)
    assert_response :success
  end

  test "should not update recipe if not signed in" do
    patch recipe_url(@recipe), params: { recipe: { author: @recipe.author, cooking_time: @recipe.cooking_time, description: @recipe.description, method: @recipe.method, prep: @recipe.prep, title: @recipe.title } }
    assert_redirected_to new_user_session_url
  end

  test "should destroy recipe when signed in" do
    sign_in users(:one)
    assert_difference('Recipe.count', -1) do
      delete recipe_url(@recipe)
    end
  end

  test "should not destroy recipe when not signed in" do
    assert_no_difference('Recipe.count') do
      delete recipe_url(@recipe)
    end
  end
end
