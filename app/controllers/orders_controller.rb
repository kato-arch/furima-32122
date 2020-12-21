class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)

     # 正常の場合、saveしてルートパスに戻る
    if @order_address.valid?
       pay_item
       @order_address.save
       redirect_to root_path
    else
        # 異常の場合
      render :index
    end
  end

  private

  def order_params
     params.require(:order_address)
     .permit(
      :postal_code, :region_id, :city, :address_line, :phone_number)
     .merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                # 通貨の種類（日本円）
    )
  end

end