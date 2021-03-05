class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @user = current_user
    @video = Video.all
  end

  def profile
    @user = current_user
    @watched_videos = Video.order("views DESC").limit(3)
    @products = @user.products
    @purchased_order = Order.where(user: @user, confirmed: true)
  end

  def search
    @results = PgSearch.multisearch(params[:q])

    @video_results = @results.where(searchable_type: 'Video')
    @video_results_mapped = []
    @video_results.each do |result|
      @video_results_mapped << Video.find(result.searchable_id)
    end

    @product_results = @results.where(searchable_type: 'Product')
    @product_results_mapped = []
    @product_results.each do |result|
      @product_results_mapped << Product.find(result.searchable_id)
    end
  end
end
