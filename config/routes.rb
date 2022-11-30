Rails.application.routes.draw do
  resources :data_sets
  get 'variance' => 'variance#index'
end
