module Refinery
  module Resm
    class Dictionary < Refinery::Core::BaseModel

      attr_accessible :name, :key, :position

      translates :name

      class Translation
        attr_accessible :locale
      end

      acts_as_indexed :fields => [:name, :key]

      validates :name, :presence => true, :uniqueness => true

      def self.get_items_by_key(key)
        dictionary = Refinery::Resm::Dictionary.where(:key => key).first
        items = Refinery::Resm::DictionaryItem.where(:dictionary_id => dictionary).all
        items
      end
    end
  end
end
