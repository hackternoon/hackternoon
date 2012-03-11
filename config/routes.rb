Hn24::Application.routes.draw do
  resources :invitations

  get "users/index"

  get "users/show/:user_id", :controller => 'users', :action => 'show', :as => 'show_user'

  resources :projects

  get "home/index"
  root :to => "home#index"

  devise_for :users, :skip => [:confirmations, :registrations]
  devise_scope :user do
    get "show",                   :to => "confirmations#show"
    get "users/confirmation",     :to => "confirmations#show",:as => 'confirm_email'
    get "users/confirmation/new", :to => "confirmations#new", :as => 'new_user_confirmation'
    put "confirm_user", :to => "confirmations#confirm_user",  :as => 'confirm_user'
    get "users/cancel", :to => "registrations#cancel", :as => 'cancel_user_registration'
    post "users",       :to => "registrations#create", :as => 'user_registration'
    get "users/sign_up",:to => "registrations#new", :as => 'new_user_registration'
    get "users/edit",   :to => "registrations#edit", :as => 'edit_user_registration'
    put "users",        :to => "registrations#update"
    delete "users",     :to => "registrations#destroy"
  end

  match 'blog' => 'home#blog', :as => :blog
  match 'terms' => 'home#terms', :as => :terms
  match 'contact' => 'home#contact', :as => :contact
  match 'tech_tips' => 'home#tech_tips', :as => :tech_tips

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
