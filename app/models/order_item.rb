class OrderItem < ApplicationRecord
  belongs_to :order

  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  validates :stripe_sku, presence: true

  def item_model
    m = Album.find_by(sku: self.stripe_sku)
    return m if m
    Instrument.find_by(sku: self.stripe_sku)
  end
end
