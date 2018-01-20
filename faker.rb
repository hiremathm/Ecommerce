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


# application page
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <ul class="nav navbar-nav">
      <% if !user_signed_in? %>
        <li class="dropdown" style="font-size: 20px" ><a class="dropdown-toggle" data-toggle="dropdown">eCommerce</a>
      <% end %>
  
      <% if user_signed_in? && !current_user.is_admin %>
        <li class="dropdown" style="font-size: 20px" ><a class="dropdown-toggle" data-toggle="dropdown">eCommerce</a>
      <% end %>
      <% if user_signed_in? && current_user.is_admin %>
        <li class="dropdown" style="font-size: 20px" ><a class="dropdown-toggle" data-toggle="dropdown">eCommerce<span class="caret"></span></a>
        	<ul class="dropdown-menu">
          		<li><%= link_to "Add Product", new_product_path %></li>
          		<li><%= link_to "Add Category", new_category_path %></li>
        	   <li><%= link_to "Add SubCategory", new_sub_category_path%></li>
          </ul>
        </li>
      <% end %>
    </ul>
    </div>

	<ul class="nav navbar-nav"> 
		<form class="navbar-form navbar-right"> 
  			<div class="input-group">
    			<input type="text" class="form-control" size="100" id="search" placeholder="Live Search for Product and Brands">

    			<div class="input-group-btn">
    	  			<button class="btn btn-default" type="submit">
  	      				<i class="glyphicon glyphicon-search"></i>
      				</button>
    			</div>
  			</div>
		</form>
   </ul>
    <ul class="nav navbar-nav">
		<li style="font-size: 16px "><%= link_to "Contact", addresses_contact_path %></li>  
		<li style="font-size: 16px"><a href="/cart_line_items"><span class="glyphicon glyphicon-shopping-cart"></span>Cart</a></li>
        <li style="font-size: 16px"><%= link_to "Orders", orders_path %></li>

    </ul>
    <ul class="nav navbar-nav">
      <li style="font-size: 16px"><%= link_to "Products", products_path %></li>
      
      <li class="dropdown" style="font-size: 16px"><a class="dropdown-toggle" data-toggle="dropdown">Categories<span class="caret"></span></a>
          <ul class="dropdown-menu">
              <% Category.all.each do |category| %>
                  <li> <%= link_to category.name, category_path(category.id) %></li>
              <% end %>         
          </ul>
      </li>
      <li class="dropdown" style="font-size: 16px"><a class="dropdown-toggle" data-toggle="dropdown">Sub Categories<span class="caret"></span></a>
          <ul class="dropdown-menu">
          
              <% SubCategory.all.each do |category| %>
                  <li style="font-size: 12px"> <%= link_to category.name, sub_category_path(category.id) %></li>
              <%end%>
          </ul>
      </li>
    

    <% if user_signed_in? %>
	    <li class="dropdown" style="font-size: 16px" ><a class="dropdown-toggle" data-toggle="dropdown"><b>My Account</b><span class="caret"></span></a>
        	<ul class="dropdown-menu">
          		<li><%= link_to "Profile", edit_user_registration_path %></li>
     			<li><%= link_to "Add Address", addresses_path%></li>
          		<li><%= link_to "Logout", destroy_user_session_path, method: :delete %></li>
        	</ul>
      </li>
    </ul>
    <% else %>
    	<ul class="nav navbar-nav navbar-right">
    	  <li><a href="/users/sign_in">Sign In<span class="glyphicon glyphicon-user"></span></a></li>
          <li><a href="/users/sign_up">Sign Up<span class="glyphicon glyphicon-log-in"></span></a></li>
      	</ul>
    <% end %>
    
  </div>
</nav>

<marquee direction = "right" width="50%" style="color:red">Every Day Shopping</marquee ><marquee style="color:green" direction = "left"  width="50%">Get Your Product</marquee >
