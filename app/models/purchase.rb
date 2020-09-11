class Purchase < ApplicationRecord
  belongs_to       :user
  belongs_to       :item
  has_one          :address, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_area
  
end
