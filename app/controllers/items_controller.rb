class ItemsController < ApplicationController
  # ログイン確認(ログインしていなければ、そのユーザーをログイン画面に遷移)
before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  # 送信されたIDから、商品情報を設定する（詳細画面、編集画面、更新処理、削除処理）
before_action :set_item, only: [:show, :edit, :update, :destroy]

  # トップ画面
  def index
    # 商品情報が新規投稿順に並ぶように取得
    @items = Item.includes(:user).order("created_at DESC")
  end

  # 商品出品画面
  def new
    # Itemモデルの新規オブジェクトを生成
    @item = Item.new
  end

  # 商品出品処理
  def create
    # データ保存の準備
    @item = Item.new(item_params)

      # データ保存
    if @item.save
      # 正常の場合、saveしてルートパスに戻る
      redirect_to root_path
      else
      # 異常の場合、商品出品画面を再表示
      render :new
    end

  end

  # 商品詳細画面
  def show
  
  end

  # 商品情報編集画面
  def edit
    # 商品出品者とログインしているユーザーが違う場合かつ、未販売の場合
    unless @item.user_id == current_user.id
      # トップページに遷移する
      redirect_to action: :index
    end
  end

  # 商品情報更新処理
  def update
    # データ更新
    if @item.update(item_params)
      # 正常の場合、商品詳細画面に戻る
      redirect_to item_path
     else
      # 異常の場合、商品情報編集画面を再表示
      render :edit
    end
  end

  # 商品削除処理
  def destroy
      # 商品出品者とログインしているユーザーが同一の場合
    if @item.user_id == current_user.id
      # データ削除
       @item.destroy
    end
       # トップページに遷移する
       redirect_to root_path
  end


  private

  # 商品情報設定
  def set_item
    @item = Item.find(params[:id])
  end
  
  # ストロングパラメーター取得
  def item_params
    params.require(:item).permit(
      :name, :description, :price, :category_id, :condition_id, :fee_id, :region_id, :shipping_days_id, :image
    ).merge(
      user_id: current_user.id
    )
  end
end