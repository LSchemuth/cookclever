class BasketsController < ApplicationController

  def show
    @basket = Basket.find(params[:id])
  end
end
