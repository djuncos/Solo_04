class AddColumnsToSpaces < ActiveRecord::Migration[5.0]
  def change


  		add_column :spaces, :user_id, :integer
  		add_column :spaces, :latitude, :decimal
  		add_column :spaces, :longitude, :decimal
  		add_column :spaces, :status, :integer
  		add_column :spaces, :claimed, :boolean




  end
end
