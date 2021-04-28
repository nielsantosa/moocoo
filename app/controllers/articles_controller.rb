class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_article, only: [:show]

  def index
    @articles = Article.order("date DESC")
  end

  def show
    @product = Product.find_by(name: "Microliner Ink")
    @order = Order.new
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end
end
