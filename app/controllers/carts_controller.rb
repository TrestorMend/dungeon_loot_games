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
    set_values(@order, @customer)
    clean_session
  end

  def set_order(order, customer, tax)
    order.client = customer
    order.tax = tax - order.subtotal
    order.total = order.tax + order.subtotal
    order.save
  end

  def set_values(order, customer)
    @pst = customer.province.pst
    @gst = customer.province.gst
    @hst = customer.province.hst
    @tax = set_tax(order.subtotal, @pst, @gst, @hst)
    set_order(order, customer, @tax)
  end

  def set_tax(tax, pst, gst, hst)
    tax += calculate(tax, pst) unless pst == 0
    tax += calculate(tax, gst) unless gst == 0
    tax += calculate(tax, hst) unless hst == 0
    tax
  end

  def calculate(tax, amount)
    tax * (amount * 0.01)
  end

  def clean_session
    session['client'] = nil
    session[:order_id] = nil
  end
end
