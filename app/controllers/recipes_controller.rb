class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
    @supermarkets = Supermarket.geocoded
    @markers = @supermarkets.map do |supermarket|
      supermarket_recipes = ""
      supermarket.recipes.each_with_index do |recipe, index|
        if index == supermarket.recipes.size - 1
          supermarket_recipes += "#{recipe.title}"
        else
         supermarket_recipes += "#{recipe.title}, "
       end
      end
      {
        lat: supermarket.latitude,
        lng: supermarket.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { supermarket: supermarket, supermarket_recipes: supermarket_recipes}),
        image_url: helpers.asset_url('marker.png')
      }
    end
  end

  def show
  end

  def new
    @recipe = Recipe.new
    @supermarket = Supermarket.find(params[:supermarket_id])
  end

  def create
    @supermarket = Supermarket.find(params[:supermarket_id])
    @recipe = Recipe.new(recipe_params)
    @recipe.supermarket = @supermarket
    if @recipe.save
      redirect_to recipe_path(@recipe), notice: 'Recipe was successfully created.'
    else
      render :new, notice: 'Recipe was not created.'
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe), notice: 'Recipe was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipe_path(@recipe), notice: 'Recipe was successfully deleted.'
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :description, :photo)
  end
end
