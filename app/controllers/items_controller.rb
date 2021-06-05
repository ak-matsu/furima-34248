class ItemsController < ApplicationController
  # ログインしていないユーザーをログインページの画面に促すことができる。
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all.order('created_at DESC')
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def update
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :status_id, :delivery_money_id, :prefecture_id, :delivery_day_id,
                                 :price).merge(user_id: current_user.id)
  end
end
