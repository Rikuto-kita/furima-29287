class OrderCustomer

  include ActiveModel::Model
  attr_accessor :post_code,:prefecture_id,:city,:address,:building_name,:phone_number,:token, :user_id,:item_id

  with_options presence: true  do
    validates :post_code , format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id ,numericality: { other_than: 0 }
    validates :city
    validates :address
    validates :phone_number , format: { with: /\A\d{11}\z/ }
    validates :token
    end
    
    def save
     customer = Customer.create(item_id: item_id, user_id: user_id)

      Order.create(post_code: post_code,prefecture_id: prefecture_id ,city: city ,address: address ,building_name: building_name ,phone_number: phone_number ,customer_id:customer.id)
     
    end


end

