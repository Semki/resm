# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Resm" do
    describe "Admin" do
      describe "lots" do
        login_refinery_user

        describe "lots list" do
          before do
            FactoryGirl.create(:lot, :lot_code => "UniqueTitleOne")
            FactoryGirl.create(:lot, :lot_code => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.resm_admin_lots_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.resm_admin_lots_path

            click_link "Add New Lot"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Lot Code", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Resm::Lot.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Lot Code can't be blank")
              Refinery::Resm::Lot.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:lot, :lot_code => "UniqueTitle") }

            it "should fail" do
              visit refinery.resm_admin_lots_path

              click_link "Add New Lot"

              fill_in "Lot Code", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Resm::Lot.count.should == 1
            end
          end

          context "with translations" do
            before do
              Refinery::I18n.stub(:frontend_locales).and_return([:en, :cs])
            end

            describe "add a page with title for default locale" do
              before do
                visit refinery.resm_admin_lots_path
                click_link "Add New Lot"
                fill_in "Lot Code", :with => "First column"
                click_button "Save"
              end

              it "should succeed" do
                Refinery::Resm::Lot.count.should == 1
              end

              it "should show locale flag for page" do
                p = Refinery::Resm::Lot.last
                within "#lot_#{p.id}" do
                  page.should have_css("img[src='/assets/refinery/icons/flags/en.png']")
                end
              end

              it "should show lot_code in the admin menu" do
                p = Refinery::Resm::Lot.last
                within "#lot_#{p.id}" do
                  page.should have_content('First column')
                end
              end
            end

            describe "add a lot with title for primary and secondary locale" do
              before do
                visit refinery.resm_admin_lots_path
                click_link "Add New Lot"
                fill_in "Lot Code", :with => "First column"
                click_button "Save"

                visit refinery.resm_admin_lots_path
                within ".actions" do
                  click_link "Edit this lot"
                end
                within "#switch_locale_picker" do
                  click_link "Cs"
                end
                fill_in "Lot Code", :with => "First translated column"
                click_button "Save"
              end

              it "should succeed" do
                Refinery::Resm::Lot.count.should == 1
                Refinery::Resm::Lot::Translation.count.should == 2
              end

              it "should show locale flag for page" do
                p = Refinery::Resm::Lot.last
                within "#lot_#{p.id}" do
                  page.should have_css("img[src='/assets/refinery/icons/flags/en.png']")
                  page.should have_css("img[src='/assets/refinery/icons/flags/cs.png']")
                end
              end

              it "should show lot_code in backend locale in the admin menu" do
                p = Refinery::Resm::Lot.last
                within "#lot_#{p.id}" do
                  page.should have_content('First column')
                end
              end
            end

            describe "add a lot_code with title only for secondary locale" do
              before do
                visit refinery.resm_admin_lots_path
                click_link "Add New Lot"
                within "#switch_locale_picker" do
                  click_link "Cs"
                end

                fill_in "Lot Code", :with => "First translated column"
                click_button "Save"
              end

              it "should show title in backend locale in the admin menu" do
                p = Refinery::Resm::Lot.last
                within "#lot_#{p.id}" do
                  page.should have_content('First translated column')
                end
              end

              it "should show locale flag for page" do
                p = Refinery::Resm::Lot.last
                within "#lot_#{p.id}" do
                  page.should have_css("img[src='/assets/refinery/icons/flags/cs.png']")
                end
              end
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:lot, :lot_code => "A lot_code") }

          it "should succeed" do
            visit refinery.resm_admin_lots_path

            within ".actions" do
              click_link "Edit this lot"
            end

            fill_in "Lot Code", :with => "A different lot_code"
            click_button "Save"

            page.should have_content("'A different lot_code' was successfully updated.")
            page.should have_no_content("A lot_code")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:lot, :lot_code => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.resm_admin_lots_path

            click_link "Remove this lot forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Resm::Lot.count.should == 0
          end
        end

      end
    end
  end
end
