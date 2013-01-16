module Refinery
  module Collections
    class Collection < Refinery::Core::BaseModel
      self.table_name = 'refinery_collections'

      attr_accessible :tag, :position

      acts_as_indexed :fields => [:tag]

      validates :tag, :presence => true, :uniqueness => true
    end
  end
end
