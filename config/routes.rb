Rails.application.routes.draw do
  devise_for :users
  post 'file/upload'
  get 'file/download'
  get 'file/delete'
  root 'welcome#index'
end
