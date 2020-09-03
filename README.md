# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| -----------------| ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| family_name_kama | string | null: false |
| birthday         | date   | null: false |
### Association

- has_many :customer
- has_many :item

## items テーブル

| Column              | Type   | Options     |
|  -----------------  | ------ | ----------- |
| item__name          | string | null: false |
| memo                | text   | null: false |
| category_id         | integer | null: false |
| item_status_id      | integer | null: false |
| ship_method_id      | integer | null: false |
| ship_city_id        | integer | null: false |
| ship_date_id        | integer | null: false |
| price               | integer| null: false |
| user_id             | references| null: false,foreign_key: true |
### Association
belongs_to :user
has_one :customer



### customersテーブル
| Column           | Type   | Options     |
| -----------------| ------ | ----------- |
| user_id          | references|  null: false,foreign_key: true  |
| item_id          | references| null: false,foreign_key: true |

### Association
belogs_to :user
belogs_to :item
has_one :address


## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false |
| ship_city      | string     | null: false |
| ship_address   | string     | null: false |          
| ship_to_address| string     | null: false |  
| building_name  | string     | 
| customer_id    | references | null: false, foreign_key: true |

### Association

belongs_to :customer