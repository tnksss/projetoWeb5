class Product < ApplicationRecord
	NUMBER_REGEX = /\A^[0-9]*$\Z/
  	 has_many :auction_products
  	 has_many :auctions, :through => :auction_products
   	# mount_uploaders :images, ImageUploader
	 mount_uploaders :images, ImageUploader
	 validates :name, :price, presence: true
  	# validates_numericality_of :price, :greater_than => 0
end
     
