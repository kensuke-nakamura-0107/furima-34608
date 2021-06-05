class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index]

  def index
    query = "SELECT * FROM items ORDER BY id desc"
    @items = Item.find_by_sql(query)

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
params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :postage_id, :prefecture_id, :period_id, :price ).merge(user_id: current_user.id)

end

end