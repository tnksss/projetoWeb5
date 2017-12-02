class AddImageToAuctions < ActiveRecord::Migration[5.0]
  def change
    add_column :auctions, :image, :string
  end
end
