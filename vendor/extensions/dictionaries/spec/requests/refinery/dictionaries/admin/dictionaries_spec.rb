# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Dictionaries" do
    describe "Admin" do
      describe "dictionaries" do
        login_refinery_user

        describe "dictionaries list" do
          before do
            FactoryGirl.create(:dictionary, :classname => "UniqueTitleOne")
            FactoryGirl.create(:dictionary, :classname => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.dictionaries_admin_dictionaries_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.dictionaries_admin_dictionaries_path

            click_link "Add New Dictionary"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Classname", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Dictionaries::Dictionary.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Classname can't be blank")
              Refinery::Dictionaries::Dictionary.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:dictionary, :classname => "UniqueTitle") }

            it "should fail" do
              visit refinery.dictionaries_admin_dictionaries_path

              click_link "Add New Dictionary"

              fill_in "Classname", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Dictionaries::Dictionary.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:dictionary, :classname => "A classname") }

          it "should succeed" do
            visit refinery.dictionaries_admin_dictionaries_path

            within ".actions" do
              click_link "Edit this dictionary"
            end

            fill_in "Classname", :with => "A different classname"
            click_button "Save"

            page.should have_content("'A different classname' was successfully updated.")
            page.should have_no_content("A classname")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:dictionary, :classname => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.dictionaries_admin_dictionaries_path

            click_link "Remove this dictionary forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Dictionaries::Dictionary.count.should == 0
          end
        end

      end
    end
  end
end
