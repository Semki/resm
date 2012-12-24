require 'spec_helper'

module Refinery
  module Collections
    describe Collection do
      describe "validations" do
        subject do
          FactoryGirl.create(:collection,
          :tag => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:tag) { should == "Refinery CMS" }
      end
    end
  end
end
