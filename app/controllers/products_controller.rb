class ProductsController < ApplicationController
  def index
    @products = Product.all
    @categories = Category.all
  end
  
  def show
    @product = Product.find(params[:id])
    @categories = Category.all
  end
  
  def search_results
    @products = Product.where("name LIKE ?", "%#{params[:keywords]}%")
    @categories = Category.all
  end
end
