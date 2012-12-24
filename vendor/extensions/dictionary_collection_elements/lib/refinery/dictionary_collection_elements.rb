require 'refinerycms-core'

module Refinery
  autoload :DictionaryCollectionElementsGenerator, 'generators/refinery/dictionary_collection_elements_generator'

  module DictionaryCollectionElements
    require 'refinery/dictionary_collection_elements/engine'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
