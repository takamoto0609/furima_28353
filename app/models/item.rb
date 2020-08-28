class Item < ApplicationRecord
  belongs_to       :user
  has_one          :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee_burden
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :estimated_delivery_date

  with_options presence: true do
    validates :name, :explanation, :image
    validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A[a-z0-9]+\z/i, message: "は半角英数で入力してください。"}
    validates :category_id, :status_id, :shipping_fee_burden_id, :shipping_area_id, :estimated_delivery_date_id, numericality: { other_than: 1 , message: "Select"}
  end
end
