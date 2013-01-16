module Refinery
  module Dictionaries
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Dictionaries

      engine_name :refinery_dictionaries

      initializer "register refinerycms_dictionaries plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "dictionaries"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.dictionaries_admin_dictionaries_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/dictionaries/dictionary',
            :title => 'classname'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Dictionaries)
      end
    end
  end
end
