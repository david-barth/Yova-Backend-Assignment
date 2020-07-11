Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/:clientID/readNotifications', to: 'admins#show'
  get '/:clientID/getNotifications', to: 'clients#show'
  post '/createNotification', to: 'admins#create' 
  patch '/:clientID/readNotification/:notificationID', to: 'clients#update'
end
