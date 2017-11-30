class OrderItemsController < ApplicationController
  before_action :find_order
  def index
    redirect_to order_path
  end

  def create
    if @order.order_items.exists?(stripe_sku: order_item_params['stripe_sku'])
      # Update quantity
      oi = @order.order_items.find_by(stripe_sku: order_item_params['stripe_sku'])
      oi.update(quantity: oi.quantity + order_item_params['quantity'])
    else
      @order.order_items.create(order_item_params)
    end

    redirect_to URI(request.referer).path
  end

  def update
    oi = @order.order_items.find(params['id'])

    if order_item_params['quantity'] < 1
      # If quantity == 0, remove it
      oi.destroy
    else
      oi.update(order_item_params)
    end

    redirect_to order_path
  end

  def destroy
    oi = @order.order_items.find(params['id'])
    oi.destroy
    redirect_to order_path
  end

  protected

  def order_item_params
    oi_params = params.require(:order_item).permit(:stripe_sku, :quantity)
    q = oi_params['quantity'].to_i
    q = 0 if q < 0
    oi_params['quantity'] = q
    oi_params
  end
end
