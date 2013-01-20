module Refinery
  module Resm
    class RealEstateObject < Refinery::Core::BaseModel

      attr_accessible :name, :price, :collection, :collection_id, :position

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true, :uniqueness => true

      belongs_to :collection
    end
  end
end
