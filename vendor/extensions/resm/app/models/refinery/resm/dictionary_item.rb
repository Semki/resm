module Refinery
  module Resm
    class DictionaryItem < Refinery::Core::BaseModel

      attr_accessible :name, :dictionary_id, :key, :position

      belongs_to :dictionary

      translates :name, :default => translates(:name, config.I18n.default_locale)

      class Translation
        attr_accessible :locale
      end

      acts_as_indexed :fields => [:name, :key]

      validates :name, :presence => true, :uniqueness => true
    end
  end
end
