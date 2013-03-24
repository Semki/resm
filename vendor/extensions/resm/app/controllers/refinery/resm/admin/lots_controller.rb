module Refinery
  module Resm
    module Admin
      class LotsController < ::Refinery::AdminController

        crudify :'refinery/resm/lot',
                :title_attribute => 'lot_code', :xhr_paging => true

      end
    end
  end
end
