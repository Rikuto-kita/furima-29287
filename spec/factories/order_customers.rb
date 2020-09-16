FactoryBot.define do
  factory :order_customer do
    post_code{'123-1234'}
    prefecture_id{1}
    city {"松野市"}
    address{"林1-11"}
    building_name{"サンパレオ中川503号室"}
    phone_number{"12312345678"}
    token{"hogehuga"}

  end
end
