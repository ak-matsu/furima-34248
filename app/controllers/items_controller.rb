class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:image,:name,:text,:category_id,:status_id,:delivery_money_id,:prefecture_id,:delivery_day_id,:price)
  end
  
end