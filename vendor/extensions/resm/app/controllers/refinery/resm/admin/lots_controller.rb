module Refinery
  module Resm
    module Admin
      class LotsController < ::Refinery::AdminController

        crudify :'refinery/resm/lot',
                :title_attribute => 'lot_code', :xhr_paging => true

        helper_method :get_items_by_dictionary

        def get_items_by_dictionary(key)
          Refinery::Resm::Dictionary.get_items_by_key(key)
        end

      end
    end
  end
end
