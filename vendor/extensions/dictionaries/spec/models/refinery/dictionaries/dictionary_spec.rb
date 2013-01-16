require 'spec_helper'

module Refinery
  module Dictionaries
    describe Dictionary do
      describe "validations" do
        subject do
          FactoryGirl.create(:dictionary,
          :classname => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:classname) { should == "Refinery CMS" }
      end
    end
  end
end
