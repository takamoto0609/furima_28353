class AddShippingFeeBurdenToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :shipping_fee_burden_id, :integer
  end
end
