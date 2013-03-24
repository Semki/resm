module Refinery
  module Resm
    class CollectionItem < Refinery::Core::BaseModel

      attr_accessible :dictionary_item_id, :collection_id, :position
      # def title was created automatically because you didn't specify a string field
      # when you ran the refinery:engine generator. <3 <3 Refinery CMS.
      def title
        "Override def title in vendor/extensions/resm/app/models/refinery/resm/collection_item.rb"
      end
    end
  end
end
