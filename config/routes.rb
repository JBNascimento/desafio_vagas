Rails.application.routes.draw do
  namespace 'v1' do
      resources :candidaturas
      resources :pessoas
      resources :vagas
  end
end