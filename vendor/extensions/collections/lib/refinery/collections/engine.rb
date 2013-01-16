module Refinery
  module Collections
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Collections

      engine_name :refinery_collections

      initializer "register refinerycms_collections plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "collections"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.collections_admin_collections_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/collections/collection',
            :title => 'tag'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Collections)
      end
    end
  end
end
