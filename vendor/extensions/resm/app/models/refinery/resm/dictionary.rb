module Refinery
  module Resm
    class Dictionary < Refinery::Core::BaseModel

      attr_accessible :name, :position

      translates :name

      class Translation
        attr_accessible :locale
      end

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true, :uniqueness => true
    end
  end
end
