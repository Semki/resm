module Refinery
  module Resm
    module Admin
      class CollectionItemsController < ::Refinery::AdminController

        crudify :'refinery/resm/collection_item', :xhr_paging => true

      end
    end
  end
end
