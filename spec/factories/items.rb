FactoryBot.define do
  factory :item do
    name {'商品'}
    memo {'せつめい'}
    category_id {2}
    item_status_id {2}
    ship_method_id {2}
    ship_city_id {2}
    ship_date_id {2}
    price {333}
    association :user

  end
end
