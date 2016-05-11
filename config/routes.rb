Rails.application.routes.draw do

  root             'main#home'
  get 'main/home' => 'main#home'
  get 'signup' => 'users#new'
  get 'users/show' => 'users#show'
  get 'users/edit' => 'users#edit'
  get 'users/termin' => 'users#termin'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  post 'tracks/show' => 'tracks#show'
  get 'tracks/search' => 'tracks#search'
  get 'tracks/edit' => 'tracks#edit'
  get 'tracks/index' => 'tracks#index'
  get 'tracks/input' => 'tracks#input'
  get 'tracks/delete' => 'tracks#delete'
  get 'tracks/details' => 'tracks#details'
  get 'tracks/new' => 'tracks#new'
  post 'tracks/details' => 'tracks#details'
  post 'listazeljas/index' => 'listazeljas#index'
  get 'listazeljas/index' => 'listazeljas#index'
  get 'listazeljas/add' => 'listazeljas#add'
  get 'listazeljas/delete' => 'listazeljas#delete'
  post 'listazeljas/delete' => 'listazeljas#delete'
  get 'listazeljas/potvrdi' => 'listazeljas#potvrdi'
  post 'listazeljas/potvrdi' => 'listazeljas#potvrdi'
  get 'playlists/index' => 'playlists#index'
  get 'playlists/potvrdi' => 'playlists#potvrdi'
  get 'playlists/add' => 'playlists#add'
  get 'playlists/delete' => 'playlists#delete'
  get 'playlists/get_zelje' => 'playlists#get_zelje'
  get 'uredi_urednikes/index' => 'uredi_urednikes#index'
  get 'uredi_urednikes/add' => 'uredi_urednikes#add'
  get 'uredi_urednikes/delete' => 'uredi_urednikes#delete'
  get 'uredi_urednikes/search' => 'uredi_urednikes#search'
  post 'uredi_urednikes/show' => 'uredi_urednikes#show'
  get 'playlists/show' => 'playlists#show'
  get 'playlists/new' => 'playlists#new'
  post 'playlists/new' => 'playlists#new'
  get 'administrators/index' => 'administrators#index'
  get 'administrators/add' => 'administrators#add'
  get 'administrators/delete' => 'administrators#delete'
  get 'administrators/search' => 'administrators#search'
  get 'administrators/show' => 'administrators#show'
  post 'administrators/show' => 'administrators#show'
  get 'administrators/online' => 'administrators#online'
  post 'playlists/create' => 'playlists#create'
  get 'reports/show' => 'reports#show'
  get 'reports/reproduced' => 'reports#reproduced'
  get 'reports/prefered' => 'reports#prefered'
  get 'reports/freq' => 'reports#freq'
  post 'reports/freq_show' => 'reports#freq_show'
  get 'vlasniks/index' => 'vlasniks#index'
  get 'vlasniks/add' => 'vlasniks#add'
  get 'vlasniks/delete' => 'vlasniks#delete'
  get 'vlasniks/info' => 'vlasniks#info'
  post 'vlasniks/edit' => 'vlasniks#edit'
  get 'reports/prefered_show' => 'reports#prefered_show'
  
  resources :users
  resources :account_activations,only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :tracks
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
