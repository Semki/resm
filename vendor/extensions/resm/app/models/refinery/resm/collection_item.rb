module Refinery
  module Resm
    class CollectionItem < Refinery::Core::BaseModel

      belongs_to :collection, dependent: :destroy
      belongs_to :dictionary_item, dependent: :destroy

      attr_accessible :dictionary_item_id, :collection_id, :position
      # def title was created automatically because you didn't specify a string field
      # when you ran the refinery:engine generator. <3 <3 Refinery CMS.
      def title
        res = ""
        res += dictionary_item.name unless dictionary_item.nil?
        #res += dictionary_item.name unless collection.nil?
        res
      end
    end
  end
end
