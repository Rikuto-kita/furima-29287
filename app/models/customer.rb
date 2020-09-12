class Customer < ApplicationRecord
  belogs_to :user
  belogs_to :item
end
