class ConfirmationPagesController < ApplicationController

  def show
    @user = current_user
    @basket = Basket.find_by(user_id: current_user.id)
    @orders = @basket.orders
    mail = UserMailer.with(user: @user).welcome
    mail.deliver_now
  end
end
