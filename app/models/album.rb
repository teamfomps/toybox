class Album < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :category
  has_many :songs
  mount_uploader :cover_art, CoverArtUploader

  def register_with_stripe
    return unless self.sku.nil?
    p = Stripe::Product.create({
      name: self.title,
      active: self.for_sale,
      images: [self.cover_art.url],
      url: "http://www.jackpearson.org/albums/#{self.slug}"
    })

    s = Stripe::SKU.create({
      product: p.id,
      price: 1500,
      currency: 'usd',
      inventory: { type: 'infinite' },
      active: self.for_sale,
      image: self.cover_art.url
    })

    self.stripe_id = p.id
    self.sku = s.id
    self.save!
  end
end
