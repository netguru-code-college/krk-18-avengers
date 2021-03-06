# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :authenticate_user!
  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @users = Event.find(params[:event_id]).users.pluck(:nick, :id)
  end

  def create
    @product = ProductBuilderService.new(
      product_params, params[:event_id], current_user
    ).call
    if @product.valid?
      redirect_to event_product_path(params[:event_id], @product.id)
    else
      render :new
    end
  end

  def pay_bill
    users_product = current_user.users_products
      .find_by(product_id: params[:product_id])
    users_product.update(is_paid: true)
    redirect_to event_product_path(params[:event_id], users_product.id)
  end

  private

  def product_params
    params.require(:product).permit(
      :name, :price, user_ids: []
    )
  end
end
