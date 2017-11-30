module ApplicationHelper
  def cart_item_uri(order_item)
    m = order_item.item_model
    if m.class.name == 'Album'
      return album_path(m)
    else
      return instrument_path(m)
    end
  end

  def format_pennies(pennies)
    number_to_currency(pennies / 100.0)
  end

  def checkout_options(amount)
    options = {
      src: 'https://checkout.stripe.com/checkout.js',
      class: 'stripe-button',
      data: {
        key: ENV['STRIPE_PUBLISHABLE_KEY'],
        amount: amount,
        name: 'Jack Pearson',
        description: 'OtterTunity, Inc.',
        image: asset_path('square_tree.png'),
        locale: 'auto'
      }
    }

    options
  end
end
