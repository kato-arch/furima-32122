class OrderAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :region_id, :city, :address_line, :building_number, :city, :phone_number, :user_id, :item_id, :token

    # ここにバリデーションの処理を書く
    with_options presence: true do
      validates :postal_code
      validates :region_id
      validates :city
      validates :address_line
      validates :phone_number
      validates :token
    end

      validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
      validates :region_id, numericality: { other_than: 1 }
      validates :phone_number, format: { with: /\A\d{10,11}\z/ } 

    def save
      # 各テーブルにデータを保存する処理を書く
      order = Order.create(user_id: user_id, item_id: item_id)
      # 住所の情報を保存
      Address.create(postal_code: postal_code, region_id: region_id, city: city, 
        address_line: address_line, phone_number: phone_number,order_id: order.id)
    end
end