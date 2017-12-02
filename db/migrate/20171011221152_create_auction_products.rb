class CreateAuctionProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :auction_products do |t|
      t.integer :product_id
      t.integer :auction_id
      t.integer :quantity

      t.timestamps
    end
  end
end
