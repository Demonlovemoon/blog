Rails.application.routes.draw do
  root 'welcome#index'#不是路径

  get 'welcome/index'
  #是路径

  resources :articles


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
