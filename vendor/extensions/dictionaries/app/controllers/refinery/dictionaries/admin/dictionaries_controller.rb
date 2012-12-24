module Refinery
  module Dictionaries
    module Admin
      class DictionariesController < ::Refinery::AdminController

        crudify :'refinery/dictionaries/dictionary',
                :title_attribute => 'classname', :xhr_paging => true

      end
    end
  end
end
