module Refinery
  module Resm
    class Dictionary < Refinery::Core::BaseModel

      attr_accessible :name, :key, :position

      has_many :dictionary_items

      translates :name

      class Translation
        attr_accessible :locale
      end

      acts_as_indexed :fields => [:name, :key]

      validates :name, :presence => true, :uniqueness => true

      def self.get_items_by_key(key)
        items = []
        dictionary = Refinery::Resm::Dictionary.where(:key => key).first
        items = dictionary.dictionary_items unless dictionary.nil?
        items
      end
    end
  end
end
