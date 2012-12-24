Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :collections do
    resources :collections, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :collections, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :collections, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
