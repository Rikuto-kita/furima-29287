class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

with_options presence: true do
  validates :price
 validates :name
 validates :memo
  end

  validates :price, numericality: { only_integer: true ,greater_than: 300, less_than:9999999}, format: {with: /\A[0-9]+\z/} 

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category
  validates :category_id, numericality: { other_than: 1 } 

  belongs_to_active_hash :item_status
  validates :item_status_id, numericality: { other_than: 1 } 

  belongs_to_active_hash :ship_city
  validates :ship_city_id, numericality: { other_than: 0 } 

  belongs_to_active_hash :ship_date
  validates :ship_date_id, numericality: { other_than: 1 } 
  
  belongs_to_active_hash :ship_method
  validates :ship_method_id, numericality: { other_than: 1 }

  

end    
