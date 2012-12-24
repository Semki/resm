module Refinery
  module DictionaryCollectionElements
    module Admin
      class DictionaryCollectionElementsController < ::Refinery::AdminController

        crudify :'refinery/dictionary_collection_elements/dictionary_collection_element', :xhr_paging => true

      end
    end
  end
end
