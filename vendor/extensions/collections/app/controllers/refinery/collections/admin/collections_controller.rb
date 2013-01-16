module Refinery
  module Collections
    module Admin
      class CollectionsController < ::Refinery::AdminController

        crudify :'refinery/collections/collection',
                :title_attribute => 'tag', :xhr_paging => true

      end
    end
  end
end
