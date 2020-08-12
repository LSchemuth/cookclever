class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :set_basket

  private

  def set_basket
    @basket = Basket.find_by(user_id: current_user.id)
  end
end
