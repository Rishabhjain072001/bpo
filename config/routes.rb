Rails.application.routes.draw do
  root 'pages#home'
  
  get 'services', to: 'pages#services'
  get 'about_us', to: 'pages#about_us'
  get 'contact', to: 'pages#contact'
  post 'contact', to: 'pages#send_email'
end
