# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Resm" do
    describe "Admin" do
      describe "dictionary_items" do
        login_refinery_user

        describe "dictionary_items list" do
          before do
            FactoryGirl.create(:dictionary_item, :key => "UniqueTitleOne")
            FactoryGirl.create(:dictionary_item, :key => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.resm_admin_dictionary_items_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.resm_admin_dictionary_items_path

            click_link "Add New Dictionary Item"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Key", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Resm::DictionaryItem.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Key can't be blank")
              Refinery::Resm::DictionaryItem.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:dictionary_item, :key => "UniqueTitle") }

            it "should fail" do
              visit refinery.resm_admin_dictionary_items_path

              click_link "Add New Dictionary Item"

              fill_in "Key", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Resm::DictionaryItem.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:dictionary_item, :key => "A key") }

          it "should succeed" do
            visit refinery.resm_admin_dictionary_items_path

            within ".actions" do
              click_link "Edit this dictionary item"
            end

            fill_in "Key", :with => "A different key"
            click_button "Save"

            page.should have_content("'A different key' was successfully updated.")
            page.should have_no_content("A key")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:dictionary_item, :key => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.resm_admin_dictionary_items_path

            click_link "Remove this dictionary item forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Resm::DictionaryItem.count.should == 0
          end
        end

      end
    end
  end
end
