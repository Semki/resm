Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :dictionary_collection_elements do
    resources :dictionary_collection_elements, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :dictionary_collection_elements, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :dictionary_collection_elements, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
