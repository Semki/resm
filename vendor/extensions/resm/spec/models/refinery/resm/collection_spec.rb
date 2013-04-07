require 'spec_helper'

module Refinery
  module Resm
    describe Collection do
      it {should have_many(:collection_items)}
      it {should belong_to(:lot)}

      describe "validations" do
        subject do
          FactoryGirl.create(:collection,
          :name => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:name) { should == "Refinery CMS" }
      end

      describe "can has link to collection items" do
        subject(:collection) {FactoryGirl.create(:collection, name: "collection")}
        let(:collection_item) {FactoryGirl.create(:collection_item, collection: collection)}

        its(:collection_items) {should include(collection_item) }

        it "collection item has link to collection" do
          collection_item.collection.should == collection
        end
      end
    end
  end
end
