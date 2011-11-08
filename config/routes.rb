Jobster::Application.routes.draw do
  
  resources :friendships, :memberships, :comments, :likes, :requests, :profiles, :preferences
  
  resources :posts, :only => [:create, :destroy] do 
  	resources :comments
  	resources :likes
  end 
  
  resource :profile do 
  	resources :abouts
  	resource :preference
  	resources :educations
  	resources :experiences
  	resources :competencies
  	resources :languages
  	resources :references
  end
  	
  get "home/show"
  
  resources :activities do 
  	resources :comments
  	resources :likes
  end
  
  resources :statuses do 
  	resources :comments
  	resources :likes
  end
  
  resources :pages do 
  	resources :comments
  	resources :likes
  end
  
  resources :users do
  	#get :profile, :on => :collection  
  	get :change_profile, :on => :collection 
  	resources :pages
  end
  
  resources :events do
  	get :add, :on => :collection
  	put :assistance, :on => :collection
  	#post :page, :on => :collection
  	resources :pages
  end 	
  
  resources :groups do 
  	resources :pages
  end
  
  resources :messages do 
  	collection do 
  	  get :all
  	  get :inbox
  	  get :sentbox
  	  get :trash
  	end
  	resources :replies
  end

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, :controllers => { :registrations => "registrations" }
  devise_for :users, :path => "/", :path_names => 
  { :sign_in => 'login', :sign_out => 'logout', :sign_up => 'register' }

  devise_for :users do
    get "/login", :to => "devise/sessions#new"
    get "/logout", :to => "devise/sessions#destroy"
    get "/register", :to => "registrations#new"
  end
  
  match '/user/:username',
            :controller => 'users',
            :action => 'show_by_username' 
  
  match '/pages',
            :controller => 'pages',
            :action => 'index' 
            
  match '/contacts' => "contacts#contacts"
  
  match 'contacts/:id' => "contacts#contacts_user"
  
  match 'request/:user_id' => "requests#send_request"                                              
  match 'requests/pending' => "requests#pending"
  match 'profiles/:id/preference/new' => "preferences#new"
            
  root :to => "home#show"            

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


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
   match ':controller(/:action(/:id(.:format)))'
end
