Rails.application.routes.draw do
  resources :brands
  get 'ajax/find_by_categories'
  get 'ajax/autocomplete'
  get 'ajax/cod_eligible'
  get 'ajax/by_price_asc'
  get 'ajax/by_price_desc'
  get 'validation/check_email'
  get 'ajax/By_slider'
  get 'ajax/By_slider1'
  get 'ajax/By_price_between_100_to_500'
  get 'ajax/By_price_less_than_100'
  get 'ajax/By_price_greater_than_500'

  get 'categories/find_sub_categories'
  resources :categories do 
    post 'find_sub_categories'
  end

  resources :sub_categories
  resources :taxes
  devise_for :users
  
  get 'categories/index'
  resources :products do 
    post 'By_category'
  end

  resources :reviews
  resources :cart_line_items
  post '/increase_quantity' => 'cart_line_items#increase_quantity'
  post '/decrease_quantity' => 'cart_line_items#decrease_quantity'
  resources :orders
  get 'addresses/contact'
  resources :addresses
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'products#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
