Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/ufs/:date', to: 'ufs#daily' #los :date es como un alias y representa la fecha, es decir tiene que tener uf y fecha

  get '/ufs/cliente/:client', to: 'ufs#stats'
end
