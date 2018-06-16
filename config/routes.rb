Rails.application.routes.draw do
	get 'bookers/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	# get 'bookers/show' => 'bookers#show'
    root :to => 'bookers#top'
  	post '/bookers' => 'bookers#create'
  	get '/bookers/index' => 'bookers#index'
  	get '/bookers/:id' => 'bookers#show', as: 'booker'
  	patch '/bookers/:id' => 'bookers#update', as: 'update_booker'
  	get '/bookers/:id/edit' => 'bookers#edit', as: 'edit_booker'
  	delete '/bookers/:id' => 'bookers#destroy', as: 'destroy_booker'
end
