Kpoperos::Application.routes.draw do
 
  get "home", to: 'static_pages#home'
  get "about", to: 'static_pages#about'
  get "contest", to: 'static_pages#contest'
  get "prices", to: 'static_pages#prices'
  get "contact", to: 'static_pages#contact'

  get "bandas/new", to: 'groups#new'
  #get "users/prueba"
  #get "/concursantes/:id" => 'users#show'
  
  get "bandas", to: 'groups#index'

  get "/bandas/:id" => 'groups#show'

  post "bandas/new" => 'groups#create'

  devise_for :users
  resources :users
  authenticated :user do
    root :to => "dashboard#home", as: :user_root

    get "dashboard/home"
    post "/concursar/:id", to: 'users#concursar'
    post "/salir_concurso/:id", to: 'users#salir_concurso'
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'static_pages#home'

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
