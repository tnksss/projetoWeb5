class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|

		t.string :name
      	t.decimal :price, precision: 7, scale: 2
      	t.text :description
      	t.string :state
      	t.timestamps
    end
  end
end
