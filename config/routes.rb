Mcraft::Application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations"}, path_names: {sign_in: "login",sign_out: "logout"}


  root 'home#index'


end
