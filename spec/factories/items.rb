FactoryBot.define do
  factory :item do
    
    name                  { '商品の名前' }
    description           { '商品の説明' }
    category_id           { 2 }
    condition_id          { 2 }
    fee_id                { 2 }
    region_id             { 2 }
    shipping_days_id      { 2 }
    price                 { 777 }
    association :user

    after(:build) do|item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')  
    end
  end
end
