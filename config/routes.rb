Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'tasks#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
	get 'offers/my_offers' => 'offers#my_offers'
	get 'tasks/my_tasks' => 'tasks#my_tasks'
	get 'tasks/completed_tasks' => 'tasks#completed_tasks'
	get 'calculations/my_calculations' => 'calculations#my_calculations'
	get 'calculations/:id/create_pdf' => 'calculations#create_pdf', as: :create_pdf

	post 'tasks/:task_id/offers/accept' => 'offers#accept', as: :accept_offer

	resources :attachments, :users

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
	resources :tasks do
		resources :offers, :questions
		resource :calculation, :principal, :agent
	end


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
