class AddHogeToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :hoge, :string
  end
end
