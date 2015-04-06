class ProductsController < ApplicationController
  def index
    @products = Product.all
    @categories = Category.all
  end
  
  def show
    @product = Product.find(params[:id])
    @categorys = Category.all
  end
  
  def category
    @products = Product.where("category_id == " + params[:id].to_s)
  end
end
