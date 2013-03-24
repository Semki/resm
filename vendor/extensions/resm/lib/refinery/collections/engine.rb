module Refinery
  module Resm
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Resm

      engine_name :refinery_resm

      initializer "register refinerycms_collections plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "collections"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.resm_admin_collections_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/resm/collection',
            :title => 'name'
          }
          plugin.menu_match = %r{refinery/resm/collections(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Collections)
      end
    end
  end
end
