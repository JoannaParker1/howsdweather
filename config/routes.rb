Rails.application.routes.draw do
 # the index page gets two routes:
  get 'index' => 'welcome#index'
  # a "get" route for when we initially come to the page
  post 'index' => 'welcome#index'  
  # a "post route for when we come to the page"
  # after submitting the form

  # hey, while we're here, wanna change the 'test' route?
  get 'test' => 'welcome#test'
  root 'welcome#index'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
