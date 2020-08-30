
class AddressPurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :municipalities, :address, :building_name, :phone_number, :shipping_area_id, :user_id, :item_id, :token
  
  with_options presence: true do
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipalities
    validates :address
    validates :phone_number, format: {with: /\A\d{,11}\z/, message: "is invalid. Exclude hyphen(-)"}
    validates :user_id
    validates :item_id
  end
  validates :shipping_area_id, numericality: { other_than: 1, message: "Select"} 

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(
      postal_code: postal_code, municipalities: municipalities, address: address, building_name: building_name, phone_number: phone_number, shipping_area_id: shipping_area_id,purchase_id: purchase.id
    )
 
  end

end