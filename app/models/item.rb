class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_toは参照するという意味
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee_burden
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :estimated_delivery_date



  #空の投稿を保存できないようにする
  with_options presence: true do
    validates :name, :explanation, :user_id
    validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A[a-z0-9]+\z/i, message: "は半角英数で入力してください。"}
    #プルダウンの選択が「--」の時は保存できないようにする
    validates :category_id, :status_id, :shipping_fee_burden_id, :shipping_area_id, :estimated_delivery_date_id, numericality: { other_than: 1 }
  end
end
