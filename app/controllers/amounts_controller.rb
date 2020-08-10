class AmountsController < ApplicationController
  def new
    @amount = Amount.new
    @recipe = Recipe.find(params[:recipe_id])
  end

  def create
    @amount = Amount.new(amount_params)
    @recipe = Recipe.find(params[:recipe_id])
    @amount.recipe = @recipe

    if @amount.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def destroy
    @amount = Amount.find(params[:id])
    @recipe = @amount.recipe
    @amount.destroy
    redirect_to recipe_path(@recipe)
  end

  private

  def amount_params
    params.require(:amount).permit(:quantity, :unit, :ingredient_id)
  end
end
