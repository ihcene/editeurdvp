Developpez::Application.routes.draw do
  resources :articles do
    resources :sections
    
    member do
      get 'compose'
      get 'summarize'
      put 'updatesummary'
    end
  end
  
  root :to => 'articles#index'
  
  match ':slug' => 'articles#show_by_slug', :constraints => {:slug => /.*/i}, :as => :article_by_slug
end
