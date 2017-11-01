50.times do 
	c = Category.new
	c.name = Faker::App.name
	c.save
end
50.times do 
	p = Product.new
	p.name = Faker::App.name
	p.category_id = Faker::Number.between(1, 67)
	p.stock = Faker::Number.between(1, 10)
	p.description = Faker::Lorem.paragraphs
	p.price = Faker::Commerce.price
	p.release_date = Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today)
	p.cod_eligible = Faker::Boolean.boolean
	p.image_url = Faker::Address.city
	p.save
end

100.times do
	p = Product.new
	p.name = Faker::Commerce.product_name
	p.price = Faker::Commerce.price(100..1000)
	p.description = Faker::Lorem.paragraph
	p.stock = Faker::Number.between(0,100)
	p.category_id = Category.all.sample.id
	p.cod_eligible = p.price < 750 ? true : false
	p.release_date = Faker::Time.between(Date.today - 1.year, Date.today + 2.week)
	p.image_url = Faker::Address.city
	p.save
end