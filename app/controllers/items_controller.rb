class ItemsController < ApplicationController
  def index
    @items = Item.all
    # binding.pry
  end
  
  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :text)
  end
end
