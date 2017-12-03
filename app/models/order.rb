class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  accepts_nested_attributes_for :order_items

  def cost_breakdown
    @cost_breakdown ||= compute_cost_breakdown
  end

  protected

  def compute_cost_breakdown
    limberjack = Instrument.find_by(slug: 'limberjack')

    limberjack_items = 0
    regular_items = 0
    subtotal = 0

    self.order_items.each do |oi|
      # Update counters for shipping costs
      if limberjack && limberjack.sku == oi.stripe_sku
        limberjack_items += oi.quantity.to_i
      else
        regular_items += oi.quantity.to_i
      end
      subtotal += oi.cost
    end

    ret = OpenStruct.new
    ret.subtotal = subtotal
    ret.shipping_cost = calculate_shipping(limberjack_items, regular_items)
    ret.total = ret.subtotal + ret.shipping_cost
    ret
  end

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
