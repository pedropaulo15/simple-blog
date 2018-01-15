Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 root 'posts#index', as: 'home'
 get 'about', to: 'pages#about', as: 'about'

 # Example resource route (maps HTTP verbs to controller actions)
 # Adds a bunch os routes, check by running "rake routes".
 resources :posts do 
 	resources :comments # the resources for comments route are nested inside the posts route > Check rake routes
 end


end
