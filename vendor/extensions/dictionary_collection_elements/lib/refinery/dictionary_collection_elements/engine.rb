module Refinery
  module DictionaryCollectionElements
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::DictionaryCollectionElements

      engine_name :refinery_dictionary_collection_elements

      initializer "register refinerycms_dictionary_collection_elements plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "dictionary_collection_elements"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.dictionary_collection_elements_admin_dictionary_collection_elements_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/dictionary_collection_elements/dictionary_collection_element'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::DictionaryCollectionElements)
      end
    end
  end
end
