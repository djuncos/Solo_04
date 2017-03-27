class AddColumnsToDestinations < ActiveRecord::Migration[5.0]
  def change

  		add_column :destinations, :user_id, :integer
  		add_column :destinations, :address, :string
	  	add_column :destinations, :latitude, :decimal
	  	add_column :destinations, :longitude, :decimal
	  	add_column :destinations, :user_act_latitude, :decimal
	  	add_column :destinations, :user_act_longitude, :decimal




  end
end
