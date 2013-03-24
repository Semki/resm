require 'spec_helper'

module Refinery
  module Resm
    describe DictionaryItem do
      describe "validations" do
        subject do
          FactoryGirl.create(:dictionary_item,
          :name => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:name) { should == "Refinery CMS" }
      end
    end
  end
end
