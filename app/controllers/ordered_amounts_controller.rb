class OrderedAmountsController < ApplicationController

  def increment
    @ordered_amount = OrderedAmount.find(params[:id])
    @ordered_amount.quantity += 1
    if @ordered_amount.save!
      redirect_back fallback_location: @ordered_amount.order.basket
    end
  end

  def decrement
    @ordered_amount = OrderedAmount.find(params[:id])
    @ordered_amount.quantity -= 1
    if @ordered_amount.save!
      redirect_back fallback_location: @ordered_amount.order.basket
    end
  end
end
