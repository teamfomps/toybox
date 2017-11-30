class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def find_order
    @order ||= Order.find_or_create_by(id: session[:order_id])
    session[:order_id] = @order.id
    @order
  end
end
