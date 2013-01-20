module Refinery
  module Resm
    module Admin
      class CollectionsController < ::Refinery::AdminController

        crudify :'refinery/resm/collection',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
