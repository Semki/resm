Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :resm do
    resources :collection_items, :only => [:index, :show]
    resources :dictionary_items, :only => [:index, :show]
    resources :complexes, :only => [:index, :show]
    resources :lots, :only => [:index, :show]
    resources :dictionaries, :only => [:index, :show]
    resources :collections, :only => [:index, :show]
  end

  # Admin routes
  namespace :resm, :path => '' do
    namespace :admin, :path => 'refinery/resm' do
      resources :collection_items, :except => :show do
        collection do
          post :update_positions
        end
      end
      resources :collections, :except => :show do
        collection do
          post :update_positions
        end
      end
      resources :dictionary_items, :except => :show do
        collection do
          post :update_positions
        end
      end
      resources :dictionaries, :except => :show do
        collection do
          post :update_positions
        end
      end
      resources :complexes, :except => :show do
        collection do
          post :update_positions
        end
      end
      resources :lots, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
