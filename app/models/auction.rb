class Auction < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  has_many :auction_products
  has_many :products, :through => :auction_products
 # validate :has_one_product_at_least
  validates :title, presence: true
end


  def has_one_product_at_least
    if products.empty?
      errors.add(:products, "Precisa de um produto ao menos")
    end
  end
def product_name
  product.try(:name)
end

def product_name=(name)
  self.product = Product.find_by(name: name) if name.present?
end
    