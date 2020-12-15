class ItemsController < ApplicationController
before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    # 正常の場合、saveしてルートパスに戻る
    if @item.save
      redirect_to items_path
      else
        # 異常の場合
      render "new"
    end
  end




  def show

  end

  def edit

  end


  def destroy
    
  end


end



private

# def user_params
#   devise_parameter_sanitizer.permit(:deviseの処理名, keys: [:許可するキー])
# end

def item_params
  params.require(:item).permit(:name, :description, :price, :category_id, :condition_id, :fee_id, :region_id, :shipping_days_id)
  .merge(user_id: current_user.id)
end