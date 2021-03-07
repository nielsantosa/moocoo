class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :home ]
  before_action :set_product, only: [:show, :update]

  def home
    @products = Product.all
  end

  def index
    if params[:q].nil? || params[:q] == ""
      @products = Product.all
    else
      @products = Product.search_by_product_name(params[:q])
    end
    @brands = Brand.all
  end

  def show
  end

  def update
    uploaded_photos = params[:product][:photos]
    @product.photos.attach(uploaded_photos)
    redirect_to product_path(@product)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
