class ItemsController < ApplicationController
  before_action :authenticate_user!
  def index
    #@items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :postage_payer_id, :prefecture_id, :handling_time_id, :price, :image).merge(user_id: current_user.id)
  end
end
