class AddProviderAndUidToNinjas < ActiveRecord::Migration
  def change
    add_column :ninjas, :provider, :string
    add_column :ninjas, :uid, :string
  end
end
