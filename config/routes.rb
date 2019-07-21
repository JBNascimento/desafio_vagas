Rails.application.routes.draw do
  namespace 'v1' do
      resources :candidaturas
      resources :pessoas
      resources :vagas



      resources :vagas do
        #resources :candidaturas do
           get "candidaturas/ranking"
       # end
      end

    
      
      
  end


end