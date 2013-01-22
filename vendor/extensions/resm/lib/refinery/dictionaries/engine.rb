module Refinery
  module Resm
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Resm

      engine_name :refinery_resm

      initializer "register refinerycms_dictionaries plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "dictionaries"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.resm_admin_dictionaries_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/resm/dictionary',
            :title => 'name'
          }
          plugin.menu_match = %r{refinery/resm/dictionaries(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Dictionaries)
      end
    end
  end
end
