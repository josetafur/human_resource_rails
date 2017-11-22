Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: {:format => :json} do
  	namespace :v1 do
  		resources :employees do
  			collection do
  				get 'autocomplete'
  			end
        resources :employee_skills, only: [:index, :create]
  		end
      resources :employee_skills, only: [:destroy]
  	end
  end
end
