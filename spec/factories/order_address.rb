FactoryBot.define do
  factory :order_address do


    user_id { '11' }
    item_id { '12' }
    postal_code { '123-4567' }
    region_id { 2 }
    city { '横浜市' }
    address_line { '青葉区' }
    building_number { 'ビル名' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }

  end
end 