namespace :db do
    desc "Erase and fill database"
    task :populate => :environment do

    [Product].each(&:delete_all)

    20.times do
	    product = Product.new
	    product.name = Faker::Commerce.product_name
	    product.description = Faker::ChuckNorris.fact
	    product.state = 'novo'
	    product.price = Faker::Commerce.price
	    

	    product.save!
    end
  end
end