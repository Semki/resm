# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Realestateobjects" do
    describe "Admin" do
      describe "realestateobjects" do
        login_refinery_user

        describe "realestateobjects list" do
          before do
            FactoryGirl.create(:realestateobject, :name => "UniqueTitleOne")
            FactoryGirl.create(:realestateobject, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.realestateobjects_admin_realestateobjects_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.realestateobjects_admin_realestateobjects_path

            click_link "Add New Realestateobject"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Realestateobjects::Realestateobject.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Realestateobjects::Realestateobject.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:realestateobject, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.realestateobjects_admin_realestateobjects_path

              click_link "Add New Realestateobject"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Realestateobjects::Realestateobject.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:realestateobject, :name => "A name") }

          it "should succeed" do
            visit refinery.realestateobjects_admin_realestateobjects_path

            within ".actions" do
              click_link "Edit this realestateobject"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:realestateobject, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.realestateobjects_admin_realestateobjects_path

            click_link "Remove this realestateobject forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Realestateobjects::Realestateobject.count.should == 0
          end
        end

      end
    end
  end
end
