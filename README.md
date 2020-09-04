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

- has_many :customers
- has_many :items

## items テーブル

| Column              | Type   | Options     |
|  -----------------  | ------ | ----------- |
| name                | string | null: false |
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
| prefecture     | string     | null: false |
| city           | string     | null: false |
| address        | string     | null: false |          
| building_name  | string     | 
| phone_number   | integer    | null: false |   
| customer_id    | references | null: false, foreign_key: true |

### Association

belongs_to :customer