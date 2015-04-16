class ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page]).per(5)
    @categories = Category.all
    @order_item = current_order.order_items.new
  end
  
  def show
    @product = Product.find(params[:id])
    @categories = Category.all
  end
  
  def search_results
    @order_item = current_order.order_items.new
    if params[:post]["category_id"] == ""
      @products = Product.where("name LIKE ?", "%#{params[:keywords]}%")    
    else
      @products = Product.where("name LIKE ?", "%#{params[:keywords]}%").where("category_id == #{params[:post]["category_id"]}")
    end
    @categories = Category.all
  end
end
