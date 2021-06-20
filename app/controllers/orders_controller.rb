class OrdersController < ApplicationController

  # before_action :処理させたいメソッド名 only:オプション[:httpメソッド]
  before_action :set_item, only: [:create]


  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
    @addressbook = Addressbook.new
    @order_address = OrderAddress.new(order_params)

  end

  def new
      @order_address = OrderAddress.new
  end

  def create
    @addressbook = Addressbook.new
    @item = Item.find(params[:item_id])

    @order_address = OrderAddress.new(order_params)
    binding.pry
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def order_params
    params.require(:order_address)permit(:price,:postnum,:prefecture_id,:city,:banchi,:tower,:phone).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: @order_address.token,    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
