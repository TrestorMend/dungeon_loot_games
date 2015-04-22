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
    @tax = @order.subtotal
    if @customer.province.pst != 0
      @tax = @tax + (@tax * (@customer.province.pst * 0.01))
    end
    if @customer.province.gst != 0
      @tax = @tax + (@tax * (@customer.province.gst * 0.01))
    end
    if @customer.province.hst != 0
      @tax = @tax + (@tax * (@customer.province.hst * 0.01))
    end
    @tax = @tax - @order.subtotal
    @order.tax = @tax
    @order.total = @tax + @order.subtotal
    @order.save
    session['client'] = nil
    session[:order_id] = nil
  end
end
