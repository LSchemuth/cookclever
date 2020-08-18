class ConfirmationPagesController < ApplicationController

  def show
    @user = current_user
    @basket = Basket.find_by(user_id: current_user.id)
    @orders = @basket.orders
  end
end
