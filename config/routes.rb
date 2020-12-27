Rails.application.routes.draw do
  devise_for :users
  # ルートパスの設定
  root to: "items#index"
  # usersのパス
  resources :users, only: :show

  # itemsのパス
  # itemsに関しては7つのアクション全て入っているので略している
  resources :items do
    # ordersはitemsのなかに紐付いている（do~endの中に入っている）
    resources :orders, only: [:index, :create]
  end
  
end
