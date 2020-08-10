class SupermarketsController < ApplicationController
  before_action :set_supermarket, only: [:show, :edit, :update, :destroy]
  # add_flash_types :info, :error, :warning

  def index
    @supermarkets = Supermarket.all
  #   if params[:location].present?
  #     @supermarkets = Supermarket.near(params[:location], 10, order: :distance).geocoded
  #     @markers = @supermarkets.map do |supermarket|
  #       {
  #         lat: supermarket.latitude,
  #         lng: supermarket.longitude,
  #         infoWindow: render_to_string(partial: "info_window", locals: { supermarket: supermarket }),
  #         image_url: helpers.asset_url('supermarket_marker.png')
  #       }
  #     end
  #   else
      # @supermarkets = Supermarket.geocoded
  #     @markers = @supermarkets.map do |supermarket|
  #       {
  #         lat: supermarket.latitude,
  #         lng: supermarket.longitude,
  #         infoWindow: render_to_string(partial: "info_window", locals: { supermarket: supermarket }),
  #         image_url: helpers.asset_url('supermarket_marker.png')
  #       }
  #     end
  #   end
  end

#   def my_supermarkets
#     @supermarkets = Supermarket.all
#     @my_supermarkets = []
#     @supermarkets.each do |supermarket|
#       if supermarket.user == current_user
#         @my_supermarkets << supermarket
#       end
#     end
#     return @my_supermarkets
#   end

  def show
  end

  def new
    @supermarket = Supermarket.new
  end

  def create
    @supermarket = Supermarket.new(supermarket_params)
    @supermarket.user = current_user
    if @supermarket.save
      redirect_to PATH!?, notice: 'Supermarket was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @supermarket.update(supermarket_params)
      redirect_to PATH!?, notice: 'Supermarket was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @supermarket.destroy
    redirect_to PATH!?, notice: 'Supermarket was successfully deleted.'
  end


  private

  def set_supermarket
    @supermarket = Supermarket.find(params[:id])
  end


  def supermarket_params
    params.require(:supermarket).permit(:name, :address)
  end
end
