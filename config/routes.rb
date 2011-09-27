Crh::Application.routes.draw do
  #tag root
  root :to => "transaction/xmls#new"
  
  namespace :participant do resources :types end

  namespace :transaction do resources :taxes end

  namespace :transaction do resources :tots end

  namespace :transaction do resources :records end

  namespace :transaction do  namespace :goods do resources :additionals end end

  namespace :transaction do resources :participants end

  namespace :transaction do  namespace :goods do resources :taxes end end

  namespace :transaction do  namespace :goods do resources :items end end

  namespace :goods do  namespace :additional do resources :values end end

  namespace :goods do  namespace :additional do resources :types end end

  namespace :transaction do resources :xmls end

  namespace :transaction do resources :record_taxes end

  namespace :goods do resources :items end

  namespace :transaction do resources :financiers end

  namespace :participant do  namespace :contact do resources :types end end

  namespace :participant do  namespace :contact do resources :emails end end

  namespace :participant do  namespace :contact do resources :addresses end end

  namespace :participant do resources :people end

  namespace :email do resources :users end

  namespace :email do resources :domains end

  namespace :financier do resources :notes end

  namespace :address do resources :places end

  namespace :taxe do resources :values end

  namespace :taxe do resources :types end

  namespace :taxe do resources :groups end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
