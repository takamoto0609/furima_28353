class Item < ApplicationRecord
  extend ActiveStorage::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :status, :shipping_fee_burden, :shipping_area, :estimated_delivery_date

  #空の投稿を保存できないようにする
  validates :name, :price, :explanation, :user_id, presence: true

  #プルダウンの選択が「--」の時は保存できないようにする
  validates :category_id, :status_id, :shipping_fee_burden_id, :shipping_area_id, :estimated_delivery_date_id, numericality: { other_than: 1 } 
end
