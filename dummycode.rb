# // *****************************************************************************************
# // var checkBoxes = document.getElementsByTagName('input');
# // 	  function validate() 
# // 	  {
 		
# //  		var checkId = [];

# //             for (var counter=0; counter < checkBoxes.length; counter++) 
# //             {
# //                 if (checkBoxes[counter].type =='checkbox' )
# //                 {
# //               	 checkId[counter]= checkBoxes[counter]["id"];
# //               	}
# //             }
# //             return checkId;	
# //         }
# // 	var pids=validate();
# // 	//console.log(pids);
# // *****************************************************************************************

# <li><%= link_to "(#{current_user.cart_line_items.pluck(:quantity).inject(:+)})", cart_line_items_path %></li>
          		
# *****************************************************************************************
# <!-- <script>
# var toggle2 = true;
# var codHandle= document.getElementById('product_cod_eligible');
# var productsHandle = document.getElementById('cod');
	
# 	codHandle.addEventListener('click',function(){
# 	if(toggle2)
# 	{
# 		var xhr = new XMLHttpRequest();
# 		var cod = function(){
# 			if(codHandle.value == 1){
# 				return "t";
# 			}else{
# 				return "f";
# 			}
# 		}
# 		xhr.open('GET', '../products/check_cod_eligible?cod_eligible=' + cod());
# 		xhr.onreadystatechange = function(){
# 			if(xhr.readyState == 4 && xhr.status ==200){
# 				var results = JSON.parse(xhr.responseText);
# 				productsHandle.innerHTML = "";
# 				results.forEach(function(result){
#   						var option = document.createElement('li');
#   						var text = document.createTextNode(result.name);
#   						option.appendChild(text);
#   						productsHandle.appendChild(option);
#   					});
# 			}

# 		}
# 		xhr.send();
# 		toggle2 = false;
# 	}else{
# 		toggle2 = true;
# 		productsHandle.innerHTML = "";
# 	}
# 	},false);
# 		// script for getting products by price below 100
# 	var toggle3;
# 	var priceHandle1 = document.getElementById('price1');
# 	var finalHandle1 = document.getElementById('priceone');
# 	priceHandle1.addEventListener('click',function(){
# 		if(toggle3)
# 		{
# 			var url= `http://localhost:3000/products/By_price_less_than_100?price=${priceHandle1.value}`;
# 			var xhr = new XMLHttpRequest();
# 				xhr.open('GET', url);
# 				xhr.onreadystatechange = function()
# 				{
# 					if(xhr.readyState == 4 && xhr.status == 200)
# 					{
# 						var response1 = JSON.parse(xhr.responseText);
# 						finalHandle1.innerHTML = "";
# 						response1.forEach(function(res1){
# 							var option = document.createElement('li');
# 		  						var text = document.createTextNode(res1.name);
# 		  						option.appendChild(text);
# 		  						finalHandle1.appendChild(option);
# 		  				});
# 					}
# 				}
# 			xhr.send();
# 			toggle3 = false;
# 		}else{
# 			toggle3 = true;
# 			finalHandle1.innerHTML = "";
# 		}
# 	},false);

# 		// script for getting products by price between 100 to 500

# 	var toggle4;
# 	var priceHandle2 = document.getElementById('price2');
# 	var finalHandle2 = document.getElementById('pricetwo');
# 	priceHandle2.addEventListener('click',function(){
# 		if(toggle4)
# 		{
# 			var url= `http://localhost:3000/products/By_price_between_100_to_500?price=${priceHandle2.value}`;
# 			var xhr = new XMLHttpRequest();
# 				xhr.open('GET', url);
# 				xhr.onreadystatechange = function()
# 				{
# 					if(xhr.readyState == 4 && xhr.status ==200)
# 					{
# 						var response2 = JSON.parse(xhr.responseText);
# 						finalHandle2.innerHTML = "";
# 						response2.forEach(function(res2)
# 						{
# 		  					var option = document.createElement('li');
# 		  						var text = document.createTextNode(res2.name);
# 		  						option.appendChild(text);
# 		  						finalHandle2.appendChild(option);

# 		  				});
# 					}

# 				}
# 			xhr.send();
# 			toggle4 = false;
# 		}else{
# 			toggle4 = true;
# 			finalHandle2.innerHTML = "";
# 		}
# 	},false);

# 		// script for getting products by price above 500

# 	var toggle5;
# 	var priceHandle3 = document.getElementById('price3');
# 	var finalHandle3 = document.getElementById('pricethree');
# 	priceHandle3.addEventListener('click',function(){
# 		if(toggle5)
# 		{
# 			var url= `http://localhost:3000/products/By_price_greater_than_500?price=${priceHandle3.value}`;
# 			var xhr = new XMLHttpRequest();
# 				xhr.open('GET', url);
# 				xhr.onreadystatechange = function()
# 				{
# 					if(xhr.readyState == 4 && xhr.status == 200)
# 					{
# 						var response3 = JSON.parse(xhr.responseText);
# 						finalHandle3.innerHTML = "";
# 						response3.forEach(function(res3){
# 							var option = document.createElement('li');
# 		  						var text = document.createTextNode(res3.name);
# 		  						option.appendChild(text);
# 		  						finalHandle3.appendChild(option);
# 		  				});
# 					}
# 				}
# 			xhr.send();
# 			toggle5 = false;
# 		}else{
# 			toggle5 = true;
# 			finalHandle3.innerHTML = "";
# 		}
# 	},false);

# //-------------SEARCH AUTOCOMPLETE -----------------

# var searchHandle = document.getElementById('product_name');

# //console.log(searchHandle);
# searchHandle.addEventListener('keypress',function(){
# 		var xhr = new XMLHttpRequest();
		
# 		xhr.open('GET', '../products/Search_by_product?name=' + searchHandle.value);
# 		xhr.onreadystatechange = function(){
# 			if(xhr.readyState == 4 && xhr.status == 200){
# 				var results = JSON.parse(xhr.responseText);
# 				results.forEach(function(result){
# 			 		var text = result.name;
# 				 	searchHandle.value =text;
# 				//console.log(text);
# 				});
# 			}
# 		}
# 		xhr.send();
# 	},false);
# //-------------------SLIDER--------------------------
# var toggle6;
# var sliderHandle1 = document.getElementById('start');
# var productSearchHandle1 = document.getElementById('productSearch1');
# sliderHandle1.addEventListener('input',function(){
# 	if(toggle6)
# 	{
# 		var xhr = new XMLHttpRequest();
# 		 xhr.open('GET','../products/By_slider?price=' + sliderHandle1.value);
# 		 xhr.onreadystatechange = function(){
# 		 	if(xhr.readyState == 4 && xhr.status == 200){
# 		 		var results = JSON.parse(xhr.responseText);
# 		 		productSearchHandle1.innerHTML = "";
# 		 		results.forEach(function(result){
# 		 			var li = document.createElement('li');
# 		 			var litxt = document.createTextNode(result.name);
# 		 			li.appendChild(litxt);
# 		 			productSearchHandle1.appendChild(li);

# 		 		});
# 		 	}
# 		 }
# 	 xhr.send();
# 	 toggle6 = false;
# 	}else{
# 		toggle6 = true;
# 		productSearchHandle1.innerHTML = "";
# 	}
# },false)

# var toggle7;
# var sliderHandle2 = document.getElementById('end');
# var productSearchHandle2 = document.getElementById('productSearch2');
# sliderHandle2.addEventListener('input',function(){
# 	if(toggle7)
# 	{
# 		var xhr = new XMLHttpRequest();
# 		 xhr.open('GET','../products/By_slider1?price=' + sliderHandle2.value);
# 		 xhr.onreadystatechange = function(){
# 		 	if(xhr.readyState == 4 && xhr.status == 200){
# 		 		var results = JSON.parse(xhr.responseText);
# 		 		productSearchHandle2.innerHTML = "";
# 		 		results.forEach(function(result){
# 		 			var li = document.createElement('li');
# 		 			var litxt = document.createTextNode(result.name);
# 		 			li.appendChild(litxt);
# 		 			productSearchHandle2.appendChild(li);

# 		 		});
# 		 	}
# 		 }
# 	 xhr.send();
# 	 toggle7 = false;
# 	}else{
# 		toggle7 = true;
# 		productSearchHandle2.innerHTML = "";
# 	}
# },false)
# </script>
#  -->

#  <!-- <!DOCTYPE html>
# <html>
# <head>
#   <title>Ecommerce</title>
#   <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true %>
#   <%= javascript_include_tag 'application', 'data-turbolinks-track' => true %>
#   <%= csrf_meta_tags %>
# </head>
# <body>
#  <%= link_to "Products", products_path %>  <%= link_to "Categories", categories_path %><%= link_to "Add tax", new_tax_path %><%= link_to "sub Categories", sub_categories_path%>----------------------------------------

# <% if user_signed_in? %> 
# 	Welcome :<%= current_user.username %>----------------------------------------
# 	(<%= link_to "Your Cart (#{current_user.cart_line_items.pluck(:quantity).inject(:+)})", cart_line_items_path %>|<%= link_to "Your orders", orders_path %>|<%= link_to "Account Setting", edit_user_registration_path %> | <%= link_to "Logout", destroy_user_session_path, method: :delete %>|<%= link_to "Add Address", addresses_path%>)

# <% else %>
#   <%= link_to "Login", new_user_session_path %> | <%= link_to "Register", new_user_registration_path %>
# <% end %>

# <p class="notice"><%= notice %></p>
# <p class="alert"><%= alert %></p>

 
# <%= yield %>

# </body>
# </html>
#  -->



	SubCategoryItem.create(name: b, price: price, stock: stock, category_id: 2, description: "All #{b}", cod_eligible: true, release_date: "2020-03-01", image_url: "", code: "DCT-#{SecureRandom.hex[0...4]}", tax_id: tax, net_price: net_price, sub_cat_id: 2)


["mobiles","mobile accessories","laptops","speakers","desktop pcs","computer accessories","gaming accessories","camera","camera accessories","network components","tablets","health care appliances","Featured"]

a = ["Mobile Cases","Headphones & Headsets","Power Banks","Screenguards","Memory Cards","Smart Headphones","Mobile Cables","Mobile Chargers","Mobile Holders"]

a = ["Gaming Laptops"]

a = ["Home Audio Speakers","Home Theatres","Soundbars","Bluetooth Speakers","DTH Set Top Box"]


a = ["Footwear", "Top Wear","Bottom Wear","Clothing","Seasonal Wear","Sports Wear","Ties","Socks","Kurta","Cap","Pyjam","Watches","Accessories"]

a = ["Clothing","Sports Wear","Western Wear","Ethnic Wear","Winter & Seasonal Wear","Footwear","Sandols","Shoes","Watches","Jewellery","Accessories"]

a = ["Boy's Clothing","Girl's Clothing","Baby Boy Clothing","Baby Girl Clothing","Kid's Footwear","Boy's Footwear","Kid's Winter Wear","Toys","School Supplies"]

a = ["Kitchen, Cookware & Serveware","Tableware & Dinnerware","Kitchen Storage","Bed Room Furniture","Living Room Furniture","Office & Study Furniture","Furnishing","Smart Home Automation","Home Lighting"]

a = ["Sports","Exercise Fitness","Food Essentials","Health & Nutrition","Books","Stationery","Medical Supplies","Gaming","Stationery"]

a = ["Televisions","Washing Machine","Air Conditioners","Refrigerators","Kitchen Appliances"]
a.each do |b|
	SubCategory.create(name: b, category_id: 25)
end


#User.create(email: "shivasorab@gmail.com", username: "shiva", mobile: "9901602848", gender: "male", is_admin: true)
#categories = ["Electronics", "Men", "Women", "Baby & Kids", "Home & Furniture", "Sports", "TV's and Appliences"] 
#categories.each do |category|
#  Category.create(name: category)
#end

#subcategories = ["mobile accessories", "laptops", "speakers", "desktop pcs", "computer accessories", "gaming accessories", "camera", "camera accessories", "network components", "tablets", "health care appliances", "Featured"] 

#subcategories.each do |subcategory|
# SubCategory.create(name: subcategory)
#end

#subcategoryitems = ["Mobile Cases", "Headphones & Headsets", "Power Banks", "Screenguards", "Memory Cards", "Smart Headphones", "Mobile Cables", "Mobile Chargers", "Mobile Holders"] 
#subcategoryitems.each do |sub_cat_item|
#  SubCategoryItem.create(name: sub_cat_item, sub_category_id: 1)
#end

data = [{"name"=>"Cubix Back Cover for Samsung Galaxy Note 8", "price"=>999, "stock"=>10, "category_id"=>1, "description"=>"Impact-Resistant TPU And Poly Carbonate Layers For Augmented Fortitude. Extra-Responsive Buttons Are Easy To Access. All Around Raised Lip & Edges Protect The Camera Ports & Screen Display. Kickstand Allow You To Watch Video And Present Mobile Screen. Speaker Grills Blast Audio Towards You Instead Of Away Providing An Improved Audio Experience. Reinforced Bumper Acts As An Air Cushion To Stop Impact Before It Reaches Your Phone. Precise Cutouts Engineered To Fit Your Mobile Perfectly Wide Ports To Accommodate All Chargers.", "cod_eligible"=>nil, "release_date"=>"Mon, 02 Mar 2020", "image_url"=>"https://rukminim1.flixcart.com/image/612/612/jrgo4280/cases-covers/back-cover/h/x/x/cubix-redi059-note-8-hybrid-cover-red-original-imafd963mfhhtwnd.jpeg?q=70","code"=>"DCT-869a", "tax_id"=>10, "net_price"=>1098, "sub_cat_id"=>1}, {"name"=>"Flipkart SmartBuy Back Cover for Realme 5", "price"=>129, "stock"=>100, "category_id"=>1, "description"=>"Sales Package\r\nMobile Phone Cover\r\nModel Number\r\nRM5_CF\r\nDesigned For\r\nRealme 5, Realme 5s, Realme 5i\r\nBrand Color\r\nBlack", "cod_eligible"=>nil, "release_date"=>"Mon, 02 Mar 2020", "image_url"=>"https://rukminim1.flixcart.com/image/612/612/k0y6cnk0/cases-covers/back-cover/2/p/f/flipkart-smartbuy-rm5-cf-original-imafkmhcpms48mqp.jpeg?q=70", "code"=>"DCT-f4c3", "tax_id"=>5, "net_price"=>135, "sub_cat_id"=>1}, {"name"=>"Flipkart SmartBuy Back Cover for Realme C3  (Transparent, Grip Case, Silicon)", "price"=>149, "stock"=>10, "category_id"=>2, "description"=>"\r\nThis soft silicone Transparent cover will protect and prevent your phone from scratches, damage and dust. The silicone cover is made from a lightweight tough strong high quality rubber/silicone material which will help you to keep your phone safe. It comes in smooth texture. This will not only look good on your phone but will protect it. This case will Style your mobile.", "cod_eligible"=>nil, "release_date"=>"Mon, 02 Mar 2020", "image_url"=>"https://rukminim1.flixcart.com/image/416/416/k6l2vm80/cases-covers/back-cover/g/u/g/fashionury-fs-rel-c3-tra-original-imafzzgzagphzfdc.jpeg?q=70", "code"=>"DCT-0cde", "tax_id"=>10, "net_price"=>163, "sub_cat_id"=>1}, {"name"=>"Flipkart SmartBuy Back Cover for Mi Redmi 8A  (Transparent, Flexible, Silicon)", "price"=>149, "stock"=>150, "category_id"=>2, "description"=>"Sales Package\r\nMobile Phone Cover\r\nModel Number\r\nR8A_TP\r\nDesigned For\r\nMi Redmi 8A\r\nBrand Color\r\nTransparent", "cod_eligible"=>nil, "release_date"=>"Mon, 02 Mar 2020", "image_url"=>"https://rukminim1.flixcart.com/image/416/416/k1l1ea80/cases-covers/back-cover/m/h/d/flipkart-smartbuy-r8a-tp-original-imafh4fyhakeazdh.jpeg?q=70", "code"=>"DCT-92ae", "tax_id"=>5, "net_price"=>156, "sub_cat_id"=>1}] 

data.each do |product|
 Product.create(product)
end