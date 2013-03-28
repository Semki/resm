module Refinery
  module Resm
    module Admin
      class ComplexesController < ::Refinery::AdminController

        crudify :'refinery/resm/complex',
                :title_attribute => 'group_name', :xhr_paging => true

        helper_method :get_items_by_dictionary

        def get_items_by_dictionary(key)
          Refinery::Resm::Dictionary.get_items_by_key(key)
        end

      end
    end
  end
end
