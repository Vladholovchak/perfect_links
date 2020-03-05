Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :links
  root 'links#index'

  # add this line to link tags to posts with the respective tag
  get 'tags/:tag', to: 'links#index', as: :tag

end
