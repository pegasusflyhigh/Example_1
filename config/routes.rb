Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dummies do
    member do 
      get :sign_in
    end
  end


end
