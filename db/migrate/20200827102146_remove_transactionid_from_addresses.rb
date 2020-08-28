class RemoveTransactionidFromAddresses < ActiveRecord::Migration[6.0]
  def change
    remove_column :addresses, :transaction_id, :integer
  end
end
