class RemoveHogeFromAddresses < ActiveRecord::Migration[6.0]
  def change
    remove_column :addresses, :hoge, :string
  end
end
