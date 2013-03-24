module Refinery
  module Resm
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Resm

      engine_name :refinery_resm

      initializer "register refinerycms_lots plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "lots"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.resm_admin_lots_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/resm/lot',
            :title => 'lot_code'
          }
          plugin.menu_match = %r{refinery/resm/lots(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Lots)
      end
    end
  end
end
