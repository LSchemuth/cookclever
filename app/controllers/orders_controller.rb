class OrdersController < ApplicationController

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @basket = Basket.find_by(user_id: current_user.id)
    @order = Order.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @basket = Basket.find_by(user_id: current_user.id)
    @order = Order.new()
    @order.basket = @basket
    @order.recipe = @recipe
    if @order.save
      redirect_to recipes_path(location: params[:location]), notice: 'Recipe was successfully added to your basket.'
    else
      render :new, notice: 'Recipe could not be added to your basket.'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to basket_path(@basket), notice: 'This item was successfully removed from your basket.'
  end


end
