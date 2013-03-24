require 'spec_helper'

module Refinery
  module Resm
    describe CollectionItem do
      describe "validations" do
        subject do
          FactoryGirl.create(:collection_item)
        end

        it { should be_valid }
        its(:errors) { should be_empty }
      end
    end
  end
end
