class ProductsController < ApplicationController
  def index
    @products = Product.all
    @categories = Category.all
  end
  
  def show
    @product = Product.find(params[:id])
    @categories = Category.all
  end
  
  def category
    @categories = Category.all
    @products = Product.where("category_id == " + params[:id].to_s)
  end
end
