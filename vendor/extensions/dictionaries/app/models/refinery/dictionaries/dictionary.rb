module Refinery
  module Dictionaries
    class Dictionary < Refinery::Core::BaseModel
      self.table_name = 'refinery_dictionaries'

      attr_accessible :classname, :createdon, :name, :localname, :parent, :external_id, :position

      acts_as_indexed :fields => [:classname, :name, :localname]

      validates :classname, :presence => true, :uniqueness => true
    end
  end
end
