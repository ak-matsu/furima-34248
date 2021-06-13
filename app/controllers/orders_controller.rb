class OrdersController < ApplicationController

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
    @addressbook = Addressbook.new

  end

  def new
      @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @addressbook = Addressbook.new

    @order_address = OrderAddress.new(order_params)
    # binding.pry
    if @order_address.valid?
      @order_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def order_params
    params.permit(:postnum,:prefecture_id,:city,:banchi,:tower,:phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
