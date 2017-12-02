class AuctionProduct < ApplicationRecord
  belongs_to :auction
  belongs_to :product
end
 