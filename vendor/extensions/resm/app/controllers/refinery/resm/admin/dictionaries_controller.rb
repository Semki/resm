module Refinery
  module Resm
    module Admin
      class DictionariesController < ::Refinery::AdminController

        crudify :'refinery/resm/dictionary',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
