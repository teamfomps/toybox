class Album < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :category
  has_many :songs
  mount_uploader :cover_art, CoverArtUploader

  scope :for_sale, -> { where(for_sale: true) }

  def name
    title
  end

  def price_in_pennies
    1500
  end

  def register_with_stripe
    return unless self.sku.nil?
    p = Stripe::Product.create({
      name: self.title,
      active: self.for_sale,
      images: [self.cover_art.url],
      url: "https://www.jackpearson.org/albums/#{self.slug}"
    })

    s = Stripe::SKU.create({
      product: p.id,
      price: self.price_in_pennies,
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
