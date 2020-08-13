class BasketsController < ApplicationController

  def show
    @basket = Basket.find(params[:id])
    @orders = @basket.orders.all
  end

  # def save
  #   # set pickup time in basket and save here to trigger email being sent
  # end
end
