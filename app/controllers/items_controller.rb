class ItemsController < ApplicationController
  # ログインしていないユーザーをログインページの画面に促すことができる。
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  # before_action :処理させたいメソッド名 only:オプション[:httpメソッド]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  before_action :set_login, only: [:edit,:update,:destroy]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to action: :index
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :status_id, :delivery_money_id, :prefecture_id, :delivery_day_id,
                                 :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_login
    redirect_to action: :index unless current_user.id == @item.user_id
  end
end
