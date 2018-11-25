class ProductsController < ApplicationController
  def new
    @product = Product.new
    @users = Event.find(params[:event_id]).users
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to event_product_path(@product)
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price)
  end
end
