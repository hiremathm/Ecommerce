// *****************************************************************************************
// var checkBoxes = document.getElementsByTagName('input');
// 	  function validate() 
// 	  {
 		
//  		var checkId = [];

//             for (var counter=0; counter < checkBoxes.length; counter++) 
//             {
//                 if (checkBoxes[counter].type =='checkbox' )
//                 {
//               	 checkId[counter]= checkBoxes[counter]["id"];
//               	}
//             }
//             return checkId;	
//         }
// 	var pids=validate();
// 	//console.log(pids);
// *****************************************************************************************

<li><%= link_to "(#{current_user.cart_line_items.pluck(:quantity).inject(:+)})", cart_line_items_path %></li>
          		
*****************************************************************************************
<!-- <script>
var toggle2 = true;
var codHandle= document.getElementById('product_cod_eligible');
var productsHandle = document.getElementById('cod');
	
	codHandle.addEventListener('click',function(){
	if(toggle2)
	{
		var xhr = new XMLHttpRequest();
		var cod = function(){
			if(codHandle.value == 1){
				return "t";
			}else{
				return "f";
			}
		}
		xhr.open('GET', '../products/check_cod_eligible?cod_eligible=' + cod());
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status ==200){
				var results = JSON.parse(xhr.responseText);
				productsHandle.innerHTML = "";
				results.forEach(function(result){
  						var option = document.createElement('li');
  						var text = document.createTextNode(result.name);
  						option.appendChild(text);
  						productsHandle.appendChild(option);
  					});
			}

		}
		xhr.send();
		toggle2 = false;
	}else{
		toggle2 = true;
		productsHandle.innerHTML = "";
	}
	},false);
		// script for getting products by price below 100
	var toggle3;
	var priceHandle1 = document.getElementById('price1');
	var finalHandle1 = document.getElementById('priceone');
	priceHandle1.addEventListener('click',function(){
		if(toggle3)
		{
			var url= `http://localhost:3000/products/By_price_less_than_100?price=${priceHandle1.value}`;
			var xhr = new XMLHttpRequest();
				xhr.open('GET', url);
				xhr.onreadystatechange = function()
				{
					if(xhr.readyState == 4 && xhr.status == 200)
					{
						var response1 = JSON.parse(xhr.responseText);
						finalHandle1.innerHTML = "";
						response1.forEach(function(res1){
							var option = document.createElement('li');
		  						var text = document.createTextNode(res1.name);
		  						option.appendChild(text);
		  						finalHandle1.appendChild(option);
		  				});
					}
				}
			xhr.send();
			toggle3 = false;
		}else{
			toggle3 = true;
			finalHandle1.innerHTML = "";
		}
	},false);

		// script for getting products by price between 100 to 500

	var toggle4;
	var priceHandle2 = document.getElementById('price2');
	var finalHandle2 = document.getElementById('pricetwo');
	priceHandle2.addEventListener('click',function(){
		if(toggle4)
		{
			var url= `http://localhost:3000/products/By_price_between_100_to_500?price=${priceHandle2.value}`;
			var xhr = new XMLHttpRequest();
				xhr.open('GET', url);
				xhr.onreadystatechange = function()
				{
					if(xhr.readyState == 4 && xhr.status ==200)
					{
						var response2 = JSON.parse(xhr.responseText);
						finalHandle2.innerHTML = "";
						response2.forEach(function(res2)
						{
		  					var option = document.createElement('li');
		  						var text = document.createTextNode(res2.name);
		  						option.appendChild(text);
		  						finalHandle2.appendChild(option);

		  				});
					}

				}
			xhr.send();
			toggle4 = false;
		}else{
			toggle4 = true;
			finalHandle2.innerHTML = "";
		}
	},false);

		// script for getting products by price above 500

	var toggle5;
	var priceHandle3 = document.getElementById('price3');
	var finalHandle3 = document.getElementById('pricethree');
	priceHandle3.addEventListener('click',function(){
		if(toggle5)
		{
			var url= `http://localhost:3000/products/By_price_greater_than_500?price=${priceHandle3.value}`;
			var xhr = new XMLHttpRequest();
				xhr.open('GET', url);
				xhr.onreadystatechange = function()
				{
					if(xhr.readyState == 4 && xhr.status == 200)
					{
						var response3 = JSON.parse(xhr.responseText);
						finalHandle3.innerHTML = "";
						response3.forEach(function(res3){
							var option = document.createElement('li');
		  						var text = document.createTextNode(res3.name);
		  						option.appendChild(text);
		  						finalHandle3.appendChild(option);
		  				});
					}
				}
			xhr.send();
			toggle5 = false;
		}else{
			toggle5 = true;
			finalHandle3.innerHTML = "";
		}
	},false);

//-------------SEARCH AUTOCOMPLETE -----------------

var searchHandle = document.getElementById('product_name');

//console.log(searchHandle);
searchHandle.addEventListener('keypress',function(){
		var xhr = new XMLHttpRequest();
		
		xhr.open('GET', '../products/Search_by_product?name=' + searchHandle.value);
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var results = JSON.parse(xhr.responseText);
				results.forEach(function(result){
			 		var text = result.name;
				 	searchHandle.value =text;
				//console.log(text);
				});
			}
		}
		xhr.send();
	},false);
//-------------------SLIDER--------------------------
var toggle6;
var sliderHandle1 = document.getElementById('start');
var productSearchHandle1 = document.getElementById('productSearch1');
sliderHandle1.addEventListener('input',function(){
	if(toggle6)
	{
		var xhr = new XMLHttpRequest();
		 xhr.open('GET','../products/By_slider?price=' + sliderHandle1.value);
		 xhr.onreadystatechange = function(){
		 	if(xhr.readyState == 4 && xhr.status == 200){
		 		var results = JSON.parse(xhr.responseText);
		 		productSearchHandle1.innerHTML = "";
		 		results.forEach(function(result){
		 			var li = document.createElement('li');
		 			var litxt = document.createTextNode(result.name);
		 			li.appendChild(litxt);
		 			productSearchHandle1.appendChild(li);

		 		});
		 	}
		 }
	 xhr.send();
	 toggle6 = false;
	}else{
		toggle6 = true;
		productSearchHandle1.innerHTML = "";
	}
},false)

var toggle7;
var sliderHandle2 = document.getElementById('end');
var productSearchHandle2 = document.getElementById('productSearch2');
sliderHandle2.addEventListener('input',function(){
	if(toggle7)
	{
		var xhr = new XMLHttpRequest();
		 xhr.open('GET','../products/By_slider1?price=' + sliderHandle2.value);
		 xhr.onreadystatechange = function(){
		 	if(xhr.readyState == 4 && xhr.status == 200){
		 		var results = JSON.parse(xhr.responseText);
		 		productSearchHandle2.innerHTML = "";
		 		results.forEach(function(result){
		 			var li = document.createElement('li');
		 			var litxt = document.createTextNode(result.name);
		 			li.appendChild(litxt);
		 			productSearchHandle2.appendChild(li);

		 		});
		 	}
		 }
	 xhr.send();
	 toggle7 = false;
	}else{
		toggle7 = true;
		productSearchHandle2.innerHTML = "";
	}
},false)
</script>
 -->

 <!-- <!DOCTYPE html>
<html>
<head>
  <title>Ecommerce</title>
  <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true %>
  <%= javascript_include_tag 'application', 'data-turbolinks-track' => true %>
  <%= csrf_meta_tags %>
</head>
<body>
 <%= link_to "Products", products_path %>  <%= link_to "Categories", categories_path %><%= link_to "Add tax", new_tax_path %><%= link_to "sub Categories", sub_categories_path%>----------------------------------------

<% if user_signed_in? %> 
	Welcome :<%= current_user.username %>----------------------------------------
	(<%= link_to "Your Cart (#{current_user.cart_line_items.pluck(:quantity).inject(:+)})", cart_line_items_path %>|<%= link_to "Your orders", orders_path %>|<%= link_to "Account Setting", edit_user_registration_path %> | <%= link_to "Logout", destroy_user_session_path, method: :delete %>|<%= link_to "Add Address", addresses_path%>)

<% else %>
  <%= link_to "Login", new_user_session_path %> | <%= link_to "Register", new_user_registration_path %>
<% end %>

<p class="notice"><%= notice %></p>
<p class="alert"><%= alert %></p>

 
<%= yield %>

</body>
</html>
 -->