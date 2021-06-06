class OrdersController < ApplicationController

  def index
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to root_path
    else
      redirect_to "/items/#{order.item.id}" 
    end
  end

  private
  def order_params
    params.require(:order).permit(:user,:item).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
