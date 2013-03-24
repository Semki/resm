module Refinery
  module Resm
    class DictionaryItem < Refinery::Core::BaseModel

      attr_accessible :name, :dictionary_id, :key, :position

      translates :name

      class Translation
        attr_accessible :locale
      end

      acts_as_indexed :fields => [:name, :key]

      validates :name, :presence => true, :uniqueness => true
    end
  end
end
