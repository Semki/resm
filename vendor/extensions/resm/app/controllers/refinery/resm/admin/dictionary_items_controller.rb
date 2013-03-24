module Refinery
  module Resm
    module Admin
      class DictionaryItemsController < ::Refinery::AdminController

        crudify :'refinery/resm/dictionary_item',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
