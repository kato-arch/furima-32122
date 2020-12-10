class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :pulldown

  validates :name,             presence: true
  validates :image,            presence: true
  validates :description,      presence: true
  validates :price,            presence: true
  validates :category_id,      presence: true
  validates :condition_id,     presence: true
  validates :fee_id,           presence: true
  validates :region_id,        presence: true
  validates :shipping_days_id, presence: true
 

