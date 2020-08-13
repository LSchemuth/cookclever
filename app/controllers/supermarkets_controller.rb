class SupermarketsController < ApplicationController
  before_action :set_supermarket, only: [:show, :edit, :update, :destroy]
  # add_flash_types :info, :error, :warning

  def show
  end

  def new
    @supermarket = Supermarket.new
  end

  def create
    @supermarket = Supermarket.new(supermarket_params)
    @supermarket.user = current_user
    if @supermarket.save
      redirect_to supermarket_path(@supermarket), notice: 'Supermarket was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @supermarket.update(supermarket_params)
      redirect_to supermarket_path(@supermarket), notice: 'Supermarket was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @supermarket.destroy
    redirect_to supermarkets_path, notice: 'Supermarket was successfully deleted.'
  end


  private

  def set_supermarket
    @supermarket = Supermarket.find(params[:id])
  end


  def supermarket_params
    params.require(:supermarket).permit(:name, :address)
  end
end
