
class AddressPurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :municipalities, :address, :building_name, :phone_number, :shipping_area_id, :user_id, :item_id
  
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(
      postal_code: postal_code, municipalities: municipalities, address: address, building_name: building_name, phone_number: phone_number, shipping_area_id: shipping_area_id,purchase_id: purchase.id
    )
 
  end
end