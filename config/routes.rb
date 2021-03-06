Rails.application.routes.draw do

  root 'goodsmarkets#index'
  get 'goodsmarkets/index'
  get 'goodsmarkets/customer'
  post '/csignin'=>'goodsmarkets#csignin', as: 'csignin'
  get 'goodsmarkets/manufacturer'
  post '/msignin'=>'goodsmarkets#msignin',  as: 'msignin'
  get 'mfrs/logout'=>'mfrs#logout', as: 'mlogout'
  get 'mfrs/profile'=>'mfrs#profile', as: 'mprofile'
  get 'custs/logout'=>'custs#logout', as: 'clogout'
  get 'custs/profile'=>'custs#profile', as: 'cprofile'
  post 'custs/search'=>'custs#search', as: 'search'
  get 'cproducts/ratings'=>'cproducts#ratings',as:'ratings'
  get 'cproducts/cart'=>'cproducts#cart',as:'cart'
  get 'cproducts/payment'=>'cproducts#payment',as:'payment'
  get 'cproducts/order'=>'cproducts#order',as:'order'
  get 'orders/confirm'=>'orders#confirm'
  get 'orders/cancel'=>'orders#cancel'
  get 'orders/show'=>'orders#show'
  get 'orders/shipped'=>'orders#shipped'
  get 'orders/delivered'=>'orders#delivered'
  get 'orders/packed'=>'orders#packed'
  get 'orders/forcecancel'=>'orders#forcecancel'
  # get 'mhomes/logout'=>'mhomes#logout', as: 'mlogout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :mfrs do
    resources :mproducts
  end
  resources :custs
  resources :cproducts
#   if Rails.env.production?
#     get '404', :to => 'application#page_not_found'
#  end
end