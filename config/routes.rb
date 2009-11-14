ActionController::Routing::Routes.draw do |map|
  map.resources :bookmarklets, :member => {
    :login => :get,
    :authorize => :post
  }
  map.root :controller => 'bookmarklets'
end
