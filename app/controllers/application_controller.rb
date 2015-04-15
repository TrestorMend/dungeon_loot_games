class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_order
  
  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
  
  def category
    @categories = Category.all
    @category = Category.find(params[:id]);
    @products = Product.where("category_id == " + params[:id].to_s)
    @order_item = current_order.order_items.new
  end  
end
