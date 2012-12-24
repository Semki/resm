module Refinery
  module Realestateobjects
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Realestateobjects

      engine_name :refinery_realestateobjects

      initializer "register refinerycms_realestateobjects plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "realestateobjects"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.realestateobjects_admin_realestateobjects_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/realestateobjects/realestateobject',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Realestateobjects)
      end
    end
  end
end
