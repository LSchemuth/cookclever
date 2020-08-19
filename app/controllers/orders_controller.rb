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
      @ordered_amounts = OrderedAmount.new
      @recipe.amounts.each do |item|
          order_amount = OrderedAmount.new(order: @order, ingredient: item.ingredient)
          order_amount.quantity = define_quantity(item.quantity)
          order_amount.save!
      end
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

  def decrement
    @order = Order.find(params[:id])
    @order.quantity -= 1 unless @order.quantity == 1
    @order.save
    @order.ordered_amounts.each do |amount|
      amount.quantity = amount.ingredient.amounts.find_by(recipe: @order.recipe).quantity * @order.quantity
      amount.save!
    end
      redirect_to @order.basket
  end

  def increment
    @order = Order.find(params[:id])
    @order.quantity += 1
    @order.save
    @order.ordered_amounts.each do |amount|
      amount.quantity = amount.ingredient.amounts.find_by(recipe: @order.recipe).quantity * @order.quantity
      amount.save!
    end
      redirect_to @order.basket
  end

  private

  def define_quantity(quantity)
    quantity < 1 ? 1 : quantity.round
  end
end
