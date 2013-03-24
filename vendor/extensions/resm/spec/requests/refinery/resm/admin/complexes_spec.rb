# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Resm" do
    describe "Admin" do
      describe "complexes" do
        login_refinery_user

        describe "complexes list" do
          before do
            FactoryGirl.create(:complex, :group_name => "UniqueTitleOne")
            FactoryGirl.create(:complex, :group_name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.resm_admin_complexes_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.resm_admin_complexes_path

            click_link "Add New Complex"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Group Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Resm::Complex.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Group Name can't be blank")
              Refinery::Resm::Complex.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:complex, :group_name => "UniqueTitle") }

            it "should fail" do
              visit refinery.resm_admin_complexes_path

              click_link "Add New Complex"

              fill_in "Group Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Resm::Complex.count.should == 1
            end
          end

          context "with translations" do
            before do
              Refinery::I18n.stub(:frontend_locales).and_return([:en, :cs])
            end

            describe "add a page with title for default locale" do
              before do
                visit refinery.resm_admin_complexes_path
                click_link "Add New Complex"
                fill_in "Group Name", :with => "First column"
                click_button "Save"
              end

              it "should succeed" do
                Refinery::Resm::Complex.count.should == 1
              end

              it "should show locale flag for page" do
                p = Refinery::Resm::Complex.last
                within "#complex_#{p.id}" do
                  page.should have_css("img[src='/assets/refinery/icons/flags/en.png']")
                end
              end

              it "should show group_name in the admin menu" do
                p = Refinery::Resm::Complex.last
                within "#complex_#{p.id}" do
                  page.should have_content('First column')
                end
              end
            end

            describe "add a complex with title for primary and secondary locale" do
              before do
                visit refinery.resm_admin_complexes_path
                click_link "Add New Complex"
                fill_in "Group Name", :with => "First column"
                click_button "Save"

                visit refinery.resm_admin_complexes_path
                within ".actions" do
                  click_link "Edit this complex"
                end
                within "#switch_locale_picker" do
                  click_link "Cs"
                end
                fill_in "Group Name", :with => "First translated column"
                click_button "Save"
              end

              it "should succeed" do
                Refinery::Resm::Complex.count.should == 1
                Refinery::Resm::Complex::Translation.count.should == 2
              end

              it "should show locale flag for page" do
                p = Refinery::Resm::Complex.last
                within "#complex_#{p.id}" do
                  page.should have_css("img[src='/assets/refinery/icons/flags/en.png']")
                  page.should have_css("img[src='/assets/refinery/icons/flags/cs.png']")
                end
              end

              it "should show group_name in backend locale in the admin menu" do
                p = Refinery::Resm::Complex.last
                within "#complex_#{p.id}" do
                  page.should have_content('First column')
                end
              end
            end

            describe "add a group_name with title only for secondary locale" do
              before do
                visit refinery.resm_admin_complexes_path
                click_link "Add New Complex"
                within "#switch_locale_picker" do
                  click_link "Cs"
                end

                fill_in "Group Name", :with => "First translated column"
                click_button "Save"
              end

              it "should show title in backend locale in the admin menu" do
                p = Refinery::Resm::Complex.last
                within "#complex_#{p.id}" do
                  page.should have_content('First translated column')
                end
              end

              it "should show locale flag for page" do
                p = Refinery::Resm::Complex.last
                within "#complex_#{p.id}" do
                  page.should have_css("img[src='/assets/refinery/icons/flags/cs.png']")
                end
              end
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:complex, :group_name => "A group_name") }

          it "should succeed" do
            visit refinery.resm_admin_complexes_path

            within ".actions" do
              click_link "Edit this complex"
            end

            fill_in "Group Name", :with => "A different group_name"
            click_button "Save"

            page.should have_content("'A different group_name' was successfully updated.")
            page.should have_no_content("A group_name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:complex, :group_name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.resm_admin_complexes_path

            click_link "Remove this complex forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Resm::Complex.count.should == 0
          end
        end

      end
    end
  end
end
