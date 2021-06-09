class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_item, only: [:edit, :update]
  before_action :user_identify, only: [:edit, :update]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def show
    @item = Item.find(params[:id])
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

  def edit
  end

  def update
    if  @item.update(item_params)
      redirect_to item_path
    else
      render action: :edit
    end
  end


private

def item_params
params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :postage_id, :prefecture_id, :period_id, :price ).merge(user_id: current_user.id)
end

def set_item
  @item = Item.find(params[:id])
end

def user_identify
  unless current_user.id == @item.user_id
    redirect_to action: :index
   end
end

end