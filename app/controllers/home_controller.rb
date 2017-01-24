class HomeController < ApplicationController
  def index
    if params[:search]
    @products = Product.search(params[:search])
  end
  end
end
