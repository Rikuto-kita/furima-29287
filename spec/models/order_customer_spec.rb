require 'rails_helper'

RSpec.describe OrderCustomer, type: :model do
  describe '#create'do
  before do
  sleep(1)
    @user = FactoryBot.create(:user) 
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('test_sample.png')
    @item.save
    @order = FactoryBot.build(:order_customer)
    @order.item_id = @item.id
    @order.user_id = @user.id
end

it '建物名以外が正しく入力出来ていれば登録可能' do
  @order.building_name = nil
  expect(@order).to be_valid
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
    @order.post_code = "1231234"
    @order.valid?
    expect(@order.errors.full_messages).to include("Post code is invalid")
  end

  it'郵便番号は3桁-４桁出ないと登録できない'do
    @order.post_code = "1233-1234"
    @order.valid?
    expect(@order.errors.full_messages).to include("Post code is invalid")
  end

  it'都道府県は必須'do
    @order.prefecture_id = 0
    @order.valid?
    expect(@order.errors.full_messages).to include("Prefecture must be other than 0")
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
    @order.phone_number = "123-1234-1234"
    @order.valid?
    expect(@order.errors.full_messages).to include("Phone number is invalid")
  end

 end
end
