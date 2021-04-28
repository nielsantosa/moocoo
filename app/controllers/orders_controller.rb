class OrdersController < ApplicationController
  before_action :set_order, only: [:add_quantity, :minus_quantity]

  def cart
    @orders = Order.where(user: current_user, confirmed: false).order("id asc")

    @total_price = 0
    @orders.each do |order|
      @total_price += order.quantity * order.product.price
    end

    respond_to do |format|
      format.html
      format.json { render json: { orders: @orders, total_price: @total_price } }
    end
  end

  def create
    strong_params = params.require(:product).permit(:product_id, :quantity)
    product = Product.find(strong_params[:product_id])
    quantity = strong_params[:quantity] || 1 # Check if quantity exists
    order = Order.new(user: current_user, confirmed: false, quantity: quantity)
    order.product = product

    # Check orders exist already?
    other_orders = current_user.orders.where(confirmed: false)
    same_order = other_orders.find { |o| o.user == current_user && o.product_id == order.product_id }
    if order.confirmed == false && same_order
      same_order.quantity += quantity
      same_order.save
      order.destroy
      order = same_order
    else
      order.save
    end

    respond_to do |format|
      format.html
      format.json { render json: order }
    end
  end

  def vidcreateorder
    product_id = params.require(:order).require(:product)
    quantity_zero = params.require(:order).permit(:quantity).values.join

    return if quantity_zero == ""

    quantity = params.require(:order).require(:quantity).to_i
    product = Product.find(product_id)

    # Check orders exist already?
    order = Order.new(user: current_user, confirmed: false, quantity: quantity, product: product)
    other_orders = current_user.orders.where(confirmed: false)
    same_order = other_orders.find { |o| o.user == current_user && o.product_id == order.product_id }
    if order.confirmed == false && same_order
      same_order.quantity += quantity
      same_order.save
      order.destroy
      order = same_order
    else
      order.save
    end

    respond_to do |format|
      format.html
      format.json { render json: order}
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    # redirect_to cart_path
    # flash.alert = "Remove items from cart"
  end

  def add_quantity
    @order.quantity += 1
    @order.save
  end

  def minus_quantity
    @order.quantity -= 1
    @order.save
  end

  private

  def set_order
    @order = Order.find(params[:order_id])
  end
end
