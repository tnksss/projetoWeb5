class AddFlagToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :flag, :boolean, default: true
  end
end
 