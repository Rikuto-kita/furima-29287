class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  attr_accessor :token
  belongs_to :customer
  belongs_to_active_hash :ship_city


end
