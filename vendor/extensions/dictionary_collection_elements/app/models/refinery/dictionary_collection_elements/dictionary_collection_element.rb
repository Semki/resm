module Refinery
  module DictionaryCollectionElements
    class DictionaryCollectionElement < Refinery::Core::BaseModel
      self.table_name = 'refinery_dictionary_collection_elements'

      attr_accessible :dictionary, :collection, :position
      # def title was created automatically because you didn't specify a string field
      # when you ran the refinery:engine generator. <3 <3 Refinery CMS.
      def title
        "Override def title in vendor/extensions/dictionary_collection_elements/app/models/refinery/dictionary_collection_elements/dictionary_collection_element.rb"
      end
    end
  end
end
