class AddPurchaseidToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :purchase_id, :integer
  end
end
