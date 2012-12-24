module Refinery
  module Dictionaries
    class Dictionary < Refinery::Core::BaseModel
      self.table_name = 'refinery_dictionaries'

      attr_accessible :classname, :name, :local_name, :parent_id, :external_id, :position

      acts_as_indexed :fields => [:classname, :name, :local_name]

      validates :classname, :presence => true, :uniqueness => true
    end
  end
end
