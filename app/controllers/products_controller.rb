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
    if (@products.empty?)
      flash[:notice] = "The search results returned empty"
      redirect_to root_path
    end
    
    @categories = Category.all
  end
  
  def order
    @order_item = current_order.order_items.new
    @products = Product.order(:price)
    @categories = Category.all
  end
  
  def new
    @order_item = current_order.order_items.new
    @products = Product.order(:created_at).limit(5);
    @categories = Category.all
  end
  
  def recent
    @order_item = current_order.order_items.new
    @products = Product.order(:updated_at).limit(5);
    @categories = Category.all
  end
end
