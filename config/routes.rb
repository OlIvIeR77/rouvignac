Rouvignac::Application.routes.draw do
  scope "(:locale)", :locale => /en|fr|es|de|nl/, defaults: { locale: 'fr' } do
    get "home/index"
    root :to => 'home#index'
    get "hameau-en-vente", to: "home#sale"
    resources :gites
    match 'gites/:id/update2' => 'gites#update2', via: [:put, :patch]
    get "administration/index"
    resources :photos
    resources :tarifs, except: [:new, :create, :index, :destroy]
    resources :events
    match '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}, via: [:get]
    get 'contact' => 'contact#new'#, :as => 'contact'#, :via => :get
    post 'contact' => 'contact#create'#, :as => 'contact'#, :via => :post
    devise_for :admins
    get "administration" => "administration#index"
  end
end
