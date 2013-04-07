require 'spec_helper'

module Refinery
  module Resm
    describe Dictionary do
      it {should have_many(:dictionary_items)}

      describe "validations" do
        subject do
          FactoryGirl.create(:dictionary,
          :name => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:name) { should == "Refinery CMS" }
      end

      describe "can has link to dictionary items" do
        subject(:dictionary) {FactoryGirl.create(:dictionary, name: "dictionary")}
        let(:dictionary_item) {FactoryGirl.create(:dictionary_item, name: "item", dictionary: dictionary)}

        its(:dictionary_items) {should include(dictionary_item) }

        it "collection item has link to dictionary item" do
          dictionary_item.dictionary.should == dictionary
        end
      end
    end
  end
end
