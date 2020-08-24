class AddEstimatedDeliveryDateToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :estimated_delivery_date_id, :integer
  end
end
