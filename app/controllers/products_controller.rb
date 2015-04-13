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
    if params[:post]["category_id"] == ""
      @products = Product.where("name LIKE ?", "%#{params[:keywords]}%")    
    else
      @products = Product.where("name LIKE ?", "%#{params[:keywords]}%").where("category_id == #{params[:post]["category_id"]}")
    end
    @categories = Category.all
  end
  
  def shopping_cart
    #code
  end
end
