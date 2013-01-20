module Refinery
  module Resm
    module Admin
      class RealEstateObjectsController < ::Refinery::AdminController
        include Refinery::Resm


        crudify :'refinery/resm/real_estate_object',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
