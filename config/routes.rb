Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "users/registrations"}

  root 'welcome#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :jobs
  resources :job_applications
  resources :profiles
  get 'my_applications',to:'job_applications#my_applications'
  get 'my_jobs',to:'jobs#my_jobs'
  get 'about_us',to:'welcome#about_us'
  get 'contact_us',to:'welcome#contact_us'
  resources :feedbacks,except: [:edit,:update]
end
