class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
    if params[:address].present?
      @supermarkets = Supermarket.near(params[:address], 10, order: :distance).geocoded
      @markers = @supermarkets.map do |supermarket|
        @supermarket_recipes = ""
        supermarket.recipes.each do |recipe|
          supermarket_recipes += "#{recipe.name}, "
          end
        end
        {
          lat: supermarket.latitude,
          lng: supermarket.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { supermarket: supermarket }),
          # image_url: helpers.asset_url('download.png')
        }

    else
      @supermarkets = Supermarket.geocoded
      @markers = @supermarkets.map do |supermarket|
        {
          lat: supermarket.latitude,
          lng: supermarket.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { supermarket: supermarket }),
          # image_url: helpers.asset_url('download.png')
        }
      end
    end
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      redirect_to recipe_path(@recipe), notice: 'Recipe was successfully created.'
    else
      render :new
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
    params.require(:recipe).permit(:title, :description)
  end
end
