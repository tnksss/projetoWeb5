class Launch < ActiveRecord::Base
  has_many :products
  	 has_many :user_launches
  	 has_many :users, :through => :user_launches
end  