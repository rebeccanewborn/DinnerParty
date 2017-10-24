class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      # @recipe.user_ids << params[:recipe][:owner_id]
      @recipe.users << @recipe.owner
      redirect_to my_profile_path
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :ingredients, :instructions, :owner_id)
  end
end
