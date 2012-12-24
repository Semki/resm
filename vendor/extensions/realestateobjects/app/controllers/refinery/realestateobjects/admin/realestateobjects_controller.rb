module Refinery
  module Realestateobjects
    module Admin
      class RealestateobjectsController < ::Refinery::AdminController

        crudify :'refinery/realestateobjects/realestateobject',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
