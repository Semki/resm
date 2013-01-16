module Refinery
  module Realestateobjects
    class Realestateobject < Refinery::Core::BaseModel
      self.table_name = 'refinery_realestateobjects'

      attr_accessible :complex, :collection, :name, :status, :price, :position

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true, :uniqueness => true
    end
  end
end
