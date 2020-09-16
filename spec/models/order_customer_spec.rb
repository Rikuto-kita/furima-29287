require 'rails_helper'

RSpec.describe OrderCustomer, type: :model do
  describe '#create'do
  before do
    @order = FactoryBot.build(:order_customer)
end

it'クレジットカードは必須'do
    @order.token = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Token can't be blank")
  end

it'郵便番号は必須'do
    @order.post_code = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Post code can't be blank")
  end

  it'郵便番号はハイフンが必須'do
    @order.post_code = 1231234
    @order.valid?
    expect(@order.errors.full_messages).to include("Post code is invalid")
  end

  it'都道府県は必須'do
    @order.prefecture_id = 0
    @order.valid?
    expect(@order.errors.full_messages).to include("Post code is invalid", "Prefecture must be other than 0")
  end

  it'市区町村は必須'do
    @order.city = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("City can't be blank")
  end

  it'番地は必須'do
    @order.address = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Address can't be blank")
  end

  it'電話番号は必須'do
    @order.phone_number = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Phone number can't be blank")
  end

  it'電話番号にはハイフンは不要で、11桁以内であること'do
    @order.phone_number = 123-1234-1234
    @order.valid?
    expect(@order.errors.full_messages).to include("Post code is invalid", "Phone number is invalid")
  end

 end
end
