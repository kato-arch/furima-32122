Rails.application.routes.draw do
  devise_for :users
  
  root to: "items#index"

  resources :users, only: :show

    # itemsに関しては7つのアクション全て入っているので略している
  resources :items do
    # ordersはitemsのなかに紐付いている（do~endの中に入っている）
    resources :orders, only: [:index, :create]
  end
  
end
