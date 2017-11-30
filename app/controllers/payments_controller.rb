class PaymentsController < ApplicationController
  before_action :find_order
  skip_before_action :verify_authenticity_token, only: [:create]
  def new
    @payment = Payment.new
    @stripe_order = Stripe::Order.retrieve(@order.stripe_id)
  end

  def create
    token = params[:stripeToken]
    stripe_order = Stripe::Order.retrieve(@order.stripe_id)
    stripe_order.pay(source: token, email: params[:stripeEmail])
    session.delete(:order_id)
    @order.destroy

    redirect_to '/store'
  end
end
