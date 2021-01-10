class Order < ApplicationRecord
  # user テーブル
  belongs_to :user
  # item テーブル
  belongs_to :item
  # address テーブル
  has_one    :address
end
