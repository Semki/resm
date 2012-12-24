require 'spec_helper'

module Refinery
  module DictionaryCollectionElements
    describe DictionaryCollectionElement do
      describe "validations" do
        subject do
          FactoryGirl.create(:dictionary_collection_element)
        end

        it { should be_valid }
        its(:errors) { should be_empty }
      end
    end
  end
end
