class ItemsController < ApplicationController
  def index
    @items = Item.all
    @items = Item.order("created_at DESC")
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
    params.require(:item).permit(:image,:name,:text,:category_id,:status_id,:delivery_money_id,:prefecture_id,:delivery_day_id,:price).merge(user_id: current_user.id)
  end
  
end