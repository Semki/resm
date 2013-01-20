Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :resm do
    resources :collections, :only => [:index, :show]
    resources :real_estate_objects, :only => [:index, :show]
  end

  # Admin routes
  namespace :resm, :path => '' do
    namespace :admin, :path => 'refinery/resm' do
      resources :collections, :except => :show do
        collection do
          post :update_positions
        end
      end
      resources :real_estate_objects, except: :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
