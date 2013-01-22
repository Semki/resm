module Refinery
  module Resm
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Resm

      engine_name :refinery_resm

      initializer "register refinerycms_dictionary_items plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "dictionary_items"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.resm_admin_dictionary_items_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/resm/dictionary_item',
            :title => 'key'
          }
          plugin.menu_match = %r{refinery/resm/dictionary_items(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::DictionaryItems)
      end
    end
  end
end
