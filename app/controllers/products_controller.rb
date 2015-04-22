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
    @products = query
    show_error if @products.empty?
    @categories = Category.all
  end

  def query
    @query = "category_id == #{params[:post]['category_id']}"
    if params[:post]['category_id'] == ''
      @products = Product.where('name LIKE ?', "%#{params[:keywords]}%")
    else
      @products = Product.where('name LIKE ?', "%#{params[:keywords]}%").where(@query)
    end
  end

  def show_error
    flash[:notice] = 'The search results returned empty'
    redirect_to root_path
  end

  def order
    @order_item = current_order.order_items.new
    @products = Product.order(:price)
    @categories = Category.all
  end

  def new
    @order_item = current_order.order_items.new
    @products = Product.order(:created_at).limit(5)
    @categories = Category.all
  end

  def recent
    @order_item = current_order.order_items.new
    @products = Product.order(:updated_at).limit(5)
    @categories = Category.all
  end
end
