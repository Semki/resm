module Refinery
  module Resm
    class DictionaryItem < Refinery::Core::BaseModel

      attr_accessible :key, :value, :parent, :dictionary, :position, :parent_id, :dictionary_id

      acts_as_indexed :fields => [:key, :value]

      validates :key, :presence => true, :uniqueness => true

      belongs_to :dictionary
      belongs_to :parent, class_name: self
    end
  end
end
