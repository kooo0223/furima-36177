class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  #def show
  #end

  private

  def item_params
    params.require(:item).permit(:text, :image).merge(user_id: current_user.id)
  end

  #def move_to_index
  #  redirect_to action: :index unless user_signed_in?
  #end
end
