module Refinery
  module Resm
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Resm

      engine_name :refinery_resm

      initializer "register refinerycms_real_estate_objects plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "real_estate_objects"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.resm_admin_real_estate_objects_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/resm/real_estate_object',
            :title => 'name'
          }
          plugin.menu_match = %r{refinery/resm/real_estate_objects(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::RealEstateObjects)
      end
    end
  end
end
