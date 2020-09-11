require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create'do
  before do
    @item = FactoryBot.build(:item)
  end


  it'nameは必須'do
    @item.name = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Name can't be blank")
  end

  it'memoは必須'do
    @item.memo = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Memo can't be blank")
  end

  it'category_idは必須'do
    @item.category_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Category is not a number")
  end

  it'item_status_idは必須'do
    @item.item_status_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Item status is not a number")
  end

  it'ship_method_idは必須'do
    @item.ship_method_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Ship method is not a number")
  end

  it'ship_city_idは必須'do
    @item.ship_city_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Ship city is not a number")
  end

  it'ship_date_idは必須'do
    @item.ship_date_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Ship date is not a number")
  end

  it'priceは必須'do
    @item.price = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number")
  end

  it'priceは半角数字のみ入力可能'do
    @item.price = '５００'
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is not a number")
end
  

  it'priceが¥300からである事'do
    @item.price = 123
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be greater than 300")
  end

  it'priceが¥9,999,999までである事'do
    @item.price = 10000000
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be less than 9999999")
  end
  
  it 'usrが紐づいてないといけない'do
    @item.user = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("User must exist")
  end

  
  end
end
