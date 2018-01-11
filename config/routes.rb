Rails.application.routes.draw do
  
  get 'user_exam_questions/index'

  get 'user_exam_controller/index'

  resources :user_exams
  mount Ckeditor::Engine => '/ckeditor'
  get 'users/index'

  devise_for :users
  resources :question_types
  resources :answers
  resources :organizers
  resources :institutions
  resources :categories
  resources :areas
  resources :mocks
  resources :mocks do
    resources :exams, except: :index
  end
  
  resources :user_exam do 
    resources :user_exam_questions
  end
  
  
  resources :exams, except: :index
  resources :exams, except: :index do
    resources :questions
  end
  resources :questions do
    resources :helper_objects
    resources :alternatives, except: :index
  end
  resources :helper_objects

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'mocks#index'

  match '/users',   to: 'users#index',   via: 'get'
  # match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  
  get "user_exam_question/new_custom_question" => 'user_exam_question#new_custom_question', :as => :new_custom_question
  
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
