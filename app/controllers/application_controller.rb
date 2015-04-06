class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def category
    @categories = Category.all
    @products = Product.where("category_id == " + params[:id].to_s)
  end
end
