class BrandsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @brands = Brand.all
    @products = Product.all
    @product = Product.where(brand_id: params[:id])
  end

  def show
    @brand = Brand.find(params[:id])
    @products = Product.where(brand_id: params[:id])
  end
end
