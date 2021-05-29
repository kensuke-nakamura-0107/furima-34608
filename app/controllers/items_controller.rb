class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
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


private

def item_params
params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :postage_id, :prefecture_id, :period_id, :price ).merge(user_id: current_user.id)

end


end