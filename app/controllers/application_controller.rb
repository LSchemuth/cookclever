class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :set_basket

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  private

  def set_basket
    if current_user
      @basket = Basket.find_by(user_id: current_user.id)
    end
  end

end
