module Refinery
  module Resm
    class CollectionItem < Refinery::Core::BaseModel

      attr_accessible :collection, :dictionary_item, :position, :collection_id, :dictionary_item_id
      # def title was created automatically because you didn't specify a string field
      # when you ran the refinery:engine generator. <3 <3 Refinery CMS.
      def title
        "Collection item #{dictionary_item.key} <-> #{collection.name}"
      end

      validates :dictionary_item_id, :presence => true
      validates :collection_id, :presence => true

      belongs_to :collection
      belongs_to :dictionary_item
    end
  end
end
