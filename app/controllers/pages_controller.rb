class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :search]

  def home
    @user = current_user
    @trends = %w[Natural Drama Eye]
    @featured_products = %w[Lipstick Blusher Eyeliner]
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

    @video_results = @results.where(searchable_type: 'Video').map(&:searchable)
    @product_results = @results.where(searchable_type: 'Product').map(&:searchable)
    @brand_results = @results.where(searchable_type: 'Brand').map(&:searchable)

    respond_to do |f|
      f.html
      f.json { render json: { video_results: @video_results } }
    end
  end

  def admin
    @product = Product.new
  end
end
