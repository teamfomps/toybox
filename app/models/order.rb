class Order < ApplicationRecord
  has_many :order_items
  accepts_nested_attributes_for :order_items

  # def count_items
  #   total = 0
  #   self.order_items.each do |oi|
  #     total += oi.quantity
  #   end
  # end
  #
  # def self.order_items(order_id)
  #   return 0 if order_id == nil
  #   find(order_id).count_items
  # end
end
