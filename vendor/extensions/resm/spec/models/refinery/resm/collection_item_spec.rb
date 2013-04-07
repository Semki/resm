require 'spec_helper'

module Refinery
  module Resm
    describe CollectionItem do

      it {should belong_to(:collection)}
      it {should belong_to(:dictionary_item)}

      describe "validations" do
        subject do
          FactoryGirl.create(:collection_item)
        end

        it { should be_valid }
        its(:errors) { should be_empty }
      end

      describe "link to collection" do
        let(:collection) {FactoryGirl.create(:collection, name: "collection")}
        subject(:collection_item) {FactoryGirl.create(:collection_item, collection: collection)}

        its(:collection) {should be}

        its("collection.name") {should == "collection"}
      end

      describe "link to dictionary item" do
        let(:dictionary_item) {FactoryGirl.create(:dictionary_item, name: "dictionary_item")}
        subject(:collection_item) {FactoryGirl.create(:collection_item, dictionary_item:dictionary_item)}

        its(:dictionary_item) {should be}

        its("dictionary_item.name") {should == "dictionary_item"}
      end
    end
  end
end
