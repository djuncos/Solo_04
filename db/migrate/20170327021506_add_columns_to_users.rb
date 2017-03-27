class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change

  	
  	add_column :users, :dest_address, :string
  	add_column :users, :dest_latitude, :decimal
  	add_column :users, :dest_longitude, :decimal
  	add_column :users, :user_act_latitude, :decimal
  	add_column :users, :user_act_longitude, :decimal


  end
end
