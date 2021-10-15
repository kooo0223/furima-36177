class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :new, :show]
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :item_find, only:[:show, :update]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if Record.exists?(item_id: params[:id]) || (Item.find(params[:id]).user_id != current_user.id)
      redirect_to root_path
    else
      item_find
    end
  end

  def update
    @item.update(item_params)
    redirect_to root_path
  end

  private

  def item_params
    column = :product, :explanation, :price, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id,
             :scheduled_delivery_id, :image
    params.require(:item).permit(column).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def item_find
    @item = Item.find(params[:id])
  end
end