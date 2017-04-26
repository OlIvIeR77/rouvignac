Rouvignac::Application.routes.draw do
  scope "(:locale)", :locale => /en|fr|es|de|nl/, defaults: { locale: 'fr' } do
    get "home/index"
    root :to => 'home#index'
    get "hameau-en-vente", to: "home#sale"
    resources :gites, only: [:index, :show]
    match 'gites/:id/update2' => 'gites#update2', via: [:put, :patch]
    get "administration/index"
    resources :photos, only: [:index]
    resources :tarifs, only: [:show]
    get 'tarifs', to: 'tarifs#show', defaults: { id: 1 }
    resources :events do
      collection do
        patch "update_event"
        delete "delete_event"
      end
    end
    namespace :crm do
      resources :gites do
        member do
          get :edit_calendar
        end
      end
      resources :calendar, only: [:index]
      resources :photos
      resources :energy_prices
      resources :clients
      resources :reservations
      resources :tarifs, except: [:new, :create, :index, :destroy]
      resources :lease_agreements, only: [:index, :show]
    end
    #match '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}, via: [:get]
    get 'contact' => 'contact#new'#, :as => 'contact'#, :via => :get
    #post 'contact' => 'contact#create'#, :as => 'contact'#, :via => :post
    devise_for :admins
    get "administration" => "administration#index"
    get 'calendar' => 'calendar#index'
    get 'all_events' => 'calendar#all_events'
  end
end
