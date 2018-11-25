class ProductBuilderService

  def initialize(product_params, event_id, owner)
    @product_params = product_params
    @event_id = event_id
    @owner = owner
  end

  def call
    product = owner.owned_events.find(event_id).products.create(product_params)
    price = product.price
    count_users = product.users_products.count
    product.users_products.each do |users_product|
      users_product.update(amount: (price / count_users))
    end
    product
  end

  private

  attr_reader :product_params, :event_id, :owner
end
