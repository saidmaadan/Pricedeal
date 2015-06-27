class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_seller! || :authenticate_buyer!

  respond_to :html

  def index
    @orders = Order.all
    respond_with(@orders)
  end

  def show
    respond_with(@order)
  end

  def new
    @order = Order.new
    @product = Product.find(params[:product_id])
    respond_with(@order)
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    @product = Product.find(params[:product_id])
    @order.buyer_id = current_buyer.id || @order.seller_id = current_seller.id
    
    @order.save
    respond_with(@order)
  end

  def update
    @order.update(order_params)
    respond_with(@order)
  end

  def destroy
    @order.destroy
    respond_with(@order)
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:street, :city, :state, :apt, :zip_code, :country)
    end
end
