# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| name            | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birth_day       | date   | null: false |

### Association
- has_many :items

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| image            | string     | null: false                    |
| name             | string     | null: false                    |
| description      | integer    | null: false                    |
| price            | integer    | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| fee_id           | integer    | null: false                    |
| region_id        | integer    | null: false                    |
| shipping_days_id | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_many :orders


## orders テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :address

## addresses テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| postal_code            | string     | null: false                    |
| region_id              | integer    | null: false                    |
| city                   | string     | null: false                    |
| address_line           | string     | null: false                    |
| building_number        | string     | null: false                    |
| phone_number           | string     | null: false                    |
| order                  | references | null: false, foreign_key: true |

### Association
belongs_to :order
