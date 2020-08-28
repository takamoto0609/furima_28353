class AddShippingidToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :shipping_area_id, :integer
  end
end
