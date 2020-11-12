class OrdersController < ApplicationController
  def index
    @item = Item.new
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)   
    if @order_form.valid?
       @order_form.save
       redirect_to root_path
    else
       render action: :index
    end
  end

  private

 def order_params
  params.require(:order_form).permit(:post_code, :prefecture, :city, :block, :building_name, :phone_number, :user_id, :item_id)
 end
  
end
