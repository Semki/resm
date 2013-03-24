require 'spec_helper'

module Refinery
  module Resm
    describe Complex do
      describe "validations" do
        subject do
          FactoryGirl.create(:complex,
          :group_name => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:group_name) { should == "Refinery CMS" }
      end
    end
  end
end
