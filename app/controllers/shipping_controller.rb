class ShippingController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    limberjack = Instrument.friendly.find('limberjack')

    limberjack_items = 0
    regular_items = 0

    order = params['order']
    order['items'].each do |oi|
      if oi['parent']['id'] == limberjack.sku
        limberjack_items += 1
      else
        regular_items += 1
      end
    end

    Rails.logger.debug("SHIPPING HOOK: #{limberjack_items} limberjacks")
    Rails.logger.debug("SHIPPING HOOK: #{regular_items} regular items")

    order_update = {
      order_id: order['id'],
      items: [], # Taxes, empty because they are included in price
      shipping_methods: []
    }

    shipping_method = {
      id: 'standard_shipping',
      description: 'Standard Shipping',
      amount: calculate_shipping(limberjack_items, regular_items),
      currency: 'usd'
    }

    order_update[:shipping_methods] << shipping_method

    response_payload = { order_update: order_update }

    render json: @response_payload
  end

  protected

  # Jack's convoluted shipping cost formula
  def calculate_shipping(limberjacks, others)
    return 0 if limberjacks + others == 0
    if limberjacks > 0
      fee = 4
    else
      fee = 2
    end

    fee += (limberjacks * 2)
    fee += others
    return fee * 100 # shipping fee in pennies
  end
end
