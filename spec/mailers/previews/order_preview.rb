# Preview all emails at http://localhost:3000/rails/mailers/contact
class OrderPreview < ActionMailer::Preview
  def confirmation
    order = Order.create!(stripe_id: 'bozo_roflcopter')

    albums = Album.for_sale.order('RANDOM()').limit(3)
    instruments = Instrument.for_sale.order('RANDOM()').limit(2)

    albums.each do |a|
      order.order_items.create!(quantity: rand(2)+ 1, stripe_sku: a.sku)
    end

    instruments.each do |i|
      order.order_items.create!(quantity: rand(2) + 1, stripe_sku: i.sku)
    end

    ret = OrderMailer.confirm_email(order, 'customer@example.com')
    ret
  end
end
