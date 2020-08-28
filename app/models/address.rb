class Address < ApplicationRecord
  belongs_to :purchase

  # with_options presence: true do
  #   validates :postal_code
  #   validates :prefectures_id
  #   validates :municipalities
  #   validates :address
  #   validates :building_name
  #   validates :phone_number
  #   validates :purchase
  #   validates :shipping_area_id
  # end

end
