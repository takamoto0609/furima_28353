class RemovePrefectureidFromAddresses < ActiveRecord::Migration[6.0]
  def change
    remove_column :addresses, :prefectures_id, :integer
  end
end
