Campfirehacks::Application.routes.draw do
  resources :sheets, :member => :show2
  match 'scripts/:id.user.js' => 'scripts#show', :format => 'js'
  match 'scripts/:id.js' => 'scripts#show', :format => 'js'

  match 'scripts2/:id.js' => 'scripts#show2', :format => 'js'
  match 'scripts2/:id.user.js' => 'scripts#show2', :format => 'js'

  root :to => 'welcome#index'
end
