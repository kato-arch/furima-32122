class OrdersController < ApplicationController
  # ログイン確認。ログアウトのユーザーは、ログイン画面へ遷移する
  before_action :authenticate_user!
  # 送信されたIDから、商品情報を設定する（商品購入画面、商品購入処理）
  before_action :set_item, only: [:index, :create]

  # 商品購入画面
  def index
    # Order_addressモデルの新規オブジェクトを生成
    @order_address = OrderAddress.new
       # 商品が売り切れている場合、あるいは出品者の場合
    if @item.order.present? || @item.user_id == current_user.id
      # トップページに遷移する
       redirect_to root_path
    end
  end

  # 商品購入処理
  def create
    # データ保存の準備
    @order_address = OrderAddress.new(order_params)

      # データ保存確認
    if @order_address.valid?
      # クレジットカード決済処理
       pay_item
       # データ保存
       @order_address.save
       # 正常の場合、トップページに戻る
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

  # 商品情報設定
  def set_item
    @item = Item.find(params[:item_id])
  end

  # クレジットカード決済処理
  def pay_item
    #  環境変数からキーを取得
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      # 商品の値段
      amount: @item.price,
      # カードトークン
      card: order_params[:token],
      # 通貨の種類（日本円）
      currency: 'jpy'
    )
  end

end