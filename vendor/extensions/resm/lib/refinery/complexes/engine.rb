module Refinery
  module Resm
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Resm

      engine_name :refinery_resm

      initializer "register refinerycms_complexes plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "complexes"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.resm_admin_complexes_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/resm/complex',
            :title => 'group_name'
          }
          plugin.menu_match = %r{refinery/resm/complexes(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Complexes)
      end
    end
  end
end
