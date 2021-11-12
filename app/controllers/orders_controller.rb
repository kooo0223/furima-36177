class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :prefecture_id, :city, :address_line, :building, :phone_number, :record_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(order_params[:item_id])[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  #def record_params
  #  params.permit(:item_id).merge(user_id: current_user.id)
  #end

  #def address_params
  #  params.permit(:postal_code, :prefecture_id, :city, :address_line, :building, :phone_number).merge(record_id: @record.id)
  #end

end