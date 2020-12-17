class ItemsController < ApplicationController
before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
before_action :set_item, only: [:show, :edit, :update, :destroy]


  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    # 正常の場合、saveしてルートパスに戻る
    if @item.save
      redirect_to root_path
      else
        # 異常の場合
      render "new"
    end
  end


  def show
  
  end


  def edit

    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
  end


  def update
    if @item.update(item_params)
      redirect_to item_path
     else
      render "edit"
    end
  end


  def destroy
    if @item.user_id == current_user.id
       @item.destroy
       redirect_to root_path
     else
       redirect_to action: :index
    end
  end


  private

  def set_item
    @item = Item.find(params[:id])
  end
  
  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :condition_id, :fee_id, :region_id, :shipping_days_id, :image)
    .merge(user_id: current_user.id)
  end
end