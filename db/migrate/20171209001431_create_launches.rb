class CreateLaunches < ActiveRecord::Migration[5.1]
  def change
    create_table :launches do |t|
    	t.float :price
    end
  end
end
   