require 'spec_helper'

module Refinery
  module Resm
    describe Lot do
      it {should have_one(:collection)}

      describe "validations" do
        subject do
          FactoryGirl.create(:lot,
          :lot_code => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:lot_code) { should == "Refinery CMS" }

        its(:collection) { should be}
        its("collection.name") { should == "Refinery CMS"}
      end

    end
  end
end
