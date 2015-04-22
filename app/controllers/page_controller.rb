class PageController < ApplicationController
  def show
    @page = Page.find_by(title: params[:title])
    @categories = Category.all
  end
end
