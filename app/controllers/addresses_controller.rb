class AddressesController < ApplicationController
  before_action :find_order
  def new
    @address = Address.new
  end

  def create
    @address = Address.from_param(params['address'])

    unless @address.valid?
      render 'new'
      return
    end

    # It's valid, send order to Stripe
    stripe_order = {
      :currency => 'usd',
      :items => [],
      :shipping => {
        :name => @address.name,
        :address => {
          :line1 => @address.line1,
          :city => @address.city,
          :state => @address.state_province
          :country => @address.country,
          :postal_code => @address.postal_code
        }
      }
    }

    unless @address.line2.blank?
      stripe_order[:shipping][:address][:line2] = @address.line2
    end

    # Add items
    @order.order_items.each do |oi|
      item = {
        type: 'sku',
        parent: oi.stripe_sku,
        quantity: oi.quantity
      }
      stripe_order[:items].append item
    end

    stripe_order = Stripe::Order.create(stripe_order)
    @order.update!(stripe_id: stripe_order['id'])

    redirect_to new_payment_path
  end
end
