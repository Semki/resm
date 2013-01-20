# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Resm" do
    describe "Admin" do
      describe "real_estate_objects" do
        login_refinery_user

        describe "real_estate_objects list" do
          before do
            FactoryGirl.create(:real_estate_object, :name => "UniqueTitleOne")
            FactoryGirl.create(:real_estate_object, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.resm_admin_real_estate_objects_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.resm_admin_real_estate_objects_path

            click_link "Add New Real Estate Object"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Resm::RealEstateObject.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Resm::RealEstateObject.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:real_estate_object, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.resm_admin_real_estate_objects_path

              click_link "Add New Real Estate Object"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Resm::RealEstateObject.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:real_estate_object, :name => "A name") }

          it "should succeed" do
            visit refinery.resm_admin_real_estate_objects_path

            within ".actions" do
              click_link "Edit this real estate object"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:real_estate_object, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.resm_admin_real_estate_objects_path

            click_link "Remove this real estate object forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Resm::RealEstateObject.count.should == 0
          end
        end

      end
    end
  end
end
