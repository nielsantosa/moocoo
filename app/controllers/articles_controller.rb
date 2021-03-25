class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @product = Product.find_by(name: "Microliner Ink")
    @order = Order.new
  end
end
