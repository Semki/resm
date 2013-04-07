module Refinery
  module Resm
    class Collection < Refinery::Core::BaseModel

      attr_accessible :name, :position, :lot_id

      belongs_to :lot
      has_many :collection_items

      translates :name

      class Translation
        attr_accessible :locale
      end

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true, :uniqueness => true
    end
  end
end
