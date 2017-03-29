class AddAddressToSpaces < ActiveRecord::Migration[5.0]
  def change

  	add_column :spaces, :address, :string

  end
end
