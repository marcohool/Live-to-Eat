class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ show edit update destroy set_collection]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1 or /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = current_user.recipes.build
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = current_user.recipes.build(recipe_params.merge(:author => current_user.name))

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: "Recipe was successfully created." }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: "Recipe was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: "Recipe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # Add and remove recipes from a users collection
  def set_collection
    operation = params[:operation]
    # Remove or adds recipe to collection based of parameters in link
      if operation == "add"
        current_user.recipes_in_collection << @recipe
        redirect_to collection_index_path, notice: "#{@recipe.title} was added to your saved recipes"
      else
        current_user.recipes_in_collection.delete(@recipe)
        redirect_to collection_index_path, notice: "#{@recipe.title} was removed from your saved recipes"
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_params
      params.require(:recipe).permit(:title, :description, :method, :prep, :cooking_time, :thumbnail)
    end
end
