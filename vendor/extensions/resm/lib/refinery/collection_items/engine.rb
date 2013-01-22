module Refinery
  module Resm
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Resm

      engine_name :refinery_resm

      initializer "register refinerycms_collection_items plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "collection_items"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.resm_admin_collection_items_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/resm/collection_item'
          }
          plugin.menu_match = %r{refinery/resm/collection_items(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::CollectionItems)
      end
    end
  end
end
