Rails.application.routes.draw do
  resources :locations do 
    collection { post :import }
  end
  root "locations#index"
end
