FisioApp::Application.routes.draw do
  resources :invoicelines

  resources :invoiceheads

  resources :rates

  resources :provenances

  resources :specialisttypes

  resources :centers

  resources :specialists

  resources :events do
    member do
      get :info
    end
  end

  resources :clinicalhistories


  get 'tabs/autocomplete_paciente_fullname'
  get 'tabs/autocomplete_paciente_firstsurname'
  get 'tabs/autocomplete_paciente_secondsurname'
  get 'tabs/autocomplete_paciente_idcode'

  resources :pacientes
  devise_for :users
  resources :tabs
  root :to => "pages#home"
  match 'tabs' => 'tabs#index'
  match 'clinicalhistories' => 'clinicalhistories#show'
  
  match 'clinicalhistories/update_rate_select/:id', :controller=>'clinicalhistories', :action => 'update_rate_select'
  match 'clinicalhistories/update_rate/:id', :controller=>'clinicalhistories', :action => 'update_rate'
  #match 'events/info/:id', :controller=>'events', :action => 'info'
  match 'events/confirm/', :controller=>'events', :action => 'confirm'
  match 'events/search_paciente_events/:id', :controller=>'events', :action => 'search_paciente_events'

  match 'clinicalhistories/search_clinicalhistory/:id', :controller=>'clinicalhistories', :action => 'search_clinicalhistory'
  match 'clinicalhistories/update_specialist/:id', :controller=>'clinicalhistories', :action => 'update_specialist'
  match 'pacientes/new_clinicalhistory/:id', :controller=>'pacientes', :action => 'new_clinicalhistory'

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
