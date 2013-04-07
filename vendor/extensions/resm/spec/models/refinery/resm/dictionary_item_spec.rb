require 'spec_helper'

module Refinery
  module Resm
    describe DictionaryItem do
      it {should belong_to(:dictionary)}
      it {should have_many(:collection_items)}

      describe "validations" do
        subject do
          FactoryGirl.create(:dictionary_item,
          :name => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:name) { should == "Refinery CMS" }
      end

      describe "can has link to dictionary" do
        let(:dictionary) {FactoryGirl.create(:dictionary, name: "dictionary")}
        let(:dictionary_item) {FactoryGirl.create(:dictionary_item, name: "item", dictionary: dictionary)}
        subject {dictionary_item}

        its(:dictionary) {should be}

        it "dictionary name should be right" do
          dictionary_item.dictionary.name.should == "dictionary"
        end
      end

      describe "can has links to collection items" do
        subject(:dictionary_item) {FactoryGirl.create(:dictionary_item, name: "item")}

        let(:collection_item_one) {FactoryGirl.create(:collection_item, dictionary_item: dictionary_item)}
        let(:collection_item_two) {FactoryGirl.create(:collection_item, dictionary_item: dictionary_item)}

        its(:collection_items) {should include(collection_item_one) }
        its(:collection_items) {should include(collection_item_two) }

        it "collection item has link to dictionary item" do
          collection_item_one.dictionary_item.should be
        end
      end
    end
  end
end
