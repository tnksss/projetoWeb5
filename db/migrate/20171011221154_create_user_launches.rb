class CreateUserLaunches < ActiveRecord::Migration[5.0]
  def change
    create_table :user_launches do |t|
      t.integer :user_id
      t.integer :launch_id
      t.integer :quantity

      t.timestamps
    end
  end
end
 