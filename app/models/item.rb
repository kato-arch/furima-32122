class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :pulldown
  has_one_attached :image

  validates :name,             presence: true
  validates :image,            presence: true
  validates :description,      presence: true
  validates :price,            presence: true
  validates :category_id,      presence: true
  validates :condition_id,     presence: true
  validates :fee_id,           presence: true
  validates :region_id,        presence: true
  validates :shipping_days_id, presence: true

  validates :category_id,        numericality: { only_integer: 1 }
  validates :condition_id,       numericality: { only_integer: 1 }
  validates :fee_id,             numericality: { only_integer: 1 }
  validates :region_id,          numericality: { only_integer: 1 }
  validates :shipping_days_id,   numericality: { only_integer: 1 }
  
  validates :price, presence:true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}                          
  validates :price, format: {with: /\A[0-9]+\z/, message: '半角数字で入力して下さい'}
end

