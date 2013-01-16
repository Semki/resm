Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :realestateobjects do
    resources :realestateobjects, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :realestateobjects, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :realestateobjects, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
