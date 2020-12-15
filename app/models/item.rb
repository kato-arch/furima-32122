class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :pulldown
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :image
    validates :description
    validates :price
    validates :category_id
    validates :condition_id
    validates :fee_id           
    validates :region_id 
    validates :shipping_days_id
  end

  with_options presence: true, numericality: { only_integer: 1 } do
    validates :category_id
    validates :condition_id
    validates :region_id
    validates :shipping_days_id
  end
  
  validates :price, presence:true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}                          
  validates :price, format: {with: /\A[0-9]+\z/, message: '半角数字で入力して下さい'}
end

