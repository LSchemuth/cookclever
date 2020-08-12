class BasketsController < ApplicationController

  def show
    @basket = Basket.find(params[:id])
    @orders = @basket.orders.all
  end
end
