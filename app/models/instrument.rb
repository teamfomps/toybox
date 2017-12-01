class Instrument < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  mount_uploader :picture, CoverArtUploader

  scope :for_sale, -> { where(for_sale: true) }

  def register_with_stripe
    return unless self.sku.nil?
    p = Stripe::Product.create({
      name: self.name,
      active: self.for_sale,
      images: [self.picture.url],
      url: "https://www.jackpearson.org/instruments/#{self.slug}"
    })

    s = Stripe::SKU.create({
      product: p.id,
      price: self.price_in_pennies,
      currency: 'usd',
      inventory: { type: 'infinite' },
      active: self.for_sale,
      image: self.picture.url
    })

    self.stripe_id = p.id
    self.sku = s.id
    self.save!
  end
end
