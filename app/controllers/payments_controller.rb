class PaymentsController < ApplicationController
  before_action :find_order
  skip_before_action :verify_authenticity_token, only: [:create]
  def new
    @stripe_order = Stripe::Order.retrieve(@order.stripe_id)
  end

  def create
    token = params[:stripeToken]
    stripe_order = Stripe::Order.retrieve(@order.stripe_id)
    stripe_order.pay(source: token, email: params[:stripeEmail])
    session.delete(:order_id)
    OrderMailer.notify_email(@order).deliver_now
    @order.destroy

    flash[:info] = "We have received your order and sent a receipt to #{params[:stripeEmail]}."
    redirect_to '/store'
  end
end
