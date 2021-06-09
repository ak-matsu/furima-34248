class OrdersController < ApplicationController

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
    @addressbook = Addressbook.new

  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def order_params
    params.require(:order).permit(:order,:postnum,:prefecture_id,:city,:banchi,:tower,:phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
