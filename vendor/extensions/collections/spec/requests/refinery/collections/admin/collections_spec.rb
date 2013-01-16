# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Collections" do
    describe "Admin" do
      describe "collections" do
        login_refinery_user

        describe "collections list" do
          before do
            FactoryGirl.create(:collection, :tag => "UniqueTitleOne")
            FactoryGirl.create(:collection, :tag => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.collections_admin_collections_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.collections_admin_collections_path

            click_link "Add New Collection"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Tag", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Collections::Collection.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Tag can't be blank")
              Refinery::Collections::Collection.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:collection, :tag => "UniqueTitle") }

            it "should fail" do
              visit refinery.collections_admin_collections_path

              click_link "Add New Collection"

              fill_in "Tag", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Collections::Collection.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:collection, :tag => "A tag") }

          it "should succeed" do
            visit refinery.collections_admin_collections_path

            within ".actions" do
              click_link "Edit this collection"
            end

            fill_in "Tag", :with => "A different tag"
            click_button "Save"

            page.should have_content("'A different tag' was successfully updated.")
            page.should have_no_content("A tag")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:collection, :tag => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.collections_admin_collections_path

            click_link "Remove this collection forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Collections::Collection.count.should == 0
          end
        end

      end
    end
  end
end
