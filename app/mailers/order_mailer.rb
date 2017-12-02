class OrderMailer < ApplicationMailer
  def notify_email(order)
    @order = order

    if Rails.env.development?
      @order_url = "https://dashboard.stripe.com/test/orders/#{@order.stripe_id}"
    else
      @order_url = "https://dashboard.stripe.com/orders/#{@order.stripe_id}"
    end

    mail(subject: 'New Order on JackPearson.org')
  end
end
