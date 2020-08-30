
class AddressPurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :municipalities, :address, :building_name, :phone_number, :shipping_area_id, :user_id, :item_id, :token
  
  with_options presence: true do
    validates :token
    validates :municipalities
    validates :address
    validates :user_id
    validates :item_id
    validates :postal_code
    validates :phone_number
  end
  validates :shipping_area_id, numericality: { other_than: 1, message: "Select"} 

  POSTAL_CODE_REGEX = /\A[0-9]{3}-[0-9]{4}\z/.freeze
  validates_format_of :postal_code, with: POSTAL_CODE_REGEX, message: 'is invalid. Write correctly, need hyphen'

  PHONE_NUMBER_REGEX = /\A\d{,11}\z/.freeze
  validates_format_of :phone_number, with: PHONE_NUMBER_REGEX, message: 'is invalid. Exclude hyphen(-)'

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(
      postal_code: postal_code, municipalities: municipalities, address: address, building_name: building_name, phone_number: phone_number, shipping_area_id: shipping_area_id,purchase_id: purchase.id
    )
 
  end

end