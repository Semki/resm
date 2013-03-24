module Refinery
  module Resm
    module Admin
      class ComplexesController < ::Refinery::AdminController

        crudify :'refinery/resm/complex',
                :title_attribute => 'group_name', :xhr_paging => true

      end
    end
  end
end
