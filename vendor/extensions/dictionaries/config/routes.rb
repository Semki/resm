Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :dictionaries do
    resources :dictionaries, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :dictionaries, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :dictionaries, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
