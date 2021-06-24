class OrdersController < ApplicationController
  # before_action :処理させたいメソッド名 only:オプション[:httpメソッド]
  before_action :set_item, only: [:index,:create]

  # ログインしていないユーザーをログインページの画面に促すことができる。
  before_action :authenticate_user!, only: [:index]

  def index
    @order_address = OrderAddress.new
    return redirect_to root_path if current_user.id == @item.user_id || !@item.order.nil?
  end

  def create
    @addressbook = Addressbook.new
    @order_address = OrderAddress.new(order_params)
    # binding.pry

    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postnum, :prefecture_id, :city, :banchi, :tower, :phone).merge(user_id: current_user.id,item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: @order_address.token, # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
