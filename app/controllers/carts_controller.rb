class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items
    @categories = Category.all
  end
  
  def checkout
    @customer = Client.find_by("email = '" + params['email'] + "'")
    @categories = Category.all
  end
  
  def invoice
    @categories = Category.all
    @customer = Client.find(session['client'])
    @order = Order.find(session[:order_id].to_i)
    @order_item = @order.order_items
    @order.client = @customer
    @tax = @order.subtotal * (@customer.province.pst) * (@customer.province.gst) * (@customer.province.hst)
    @order.tax = @tax
    @order.total = @tax + @order.subtotal
  end
end
