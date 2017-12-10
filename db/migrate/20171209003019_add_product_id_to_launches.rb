class AddProductIdToLaunches < ActiveRecord::Migration[5.1]
  def change
  	 add_column :launches, :product_id, :integer
     add_index  :launches, :product_id
  end
end
 