Rails.application.routes.draw do
  root to: redirect(path: 'devices', status: 302)

  resources :people do
    collection { post :import }
  end

  resources :devices do
    collection { post :import }
  end

  resources :licences do
    collection { post :import }
  end

  get 'import' => 'import#index'

  devise_for :users, :skip => [:registrations]
    as :user do
      get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
      put 'users' => 'devise/registrations#update', :as => 'user_registration'
    end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
