module Refinery
  module Resm
    class RealEstateObjectsController < ::ApplicationController

      before_filter :find_all_real_estate_objects
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @real_estate_object in the line below:
        present(@page)
      end

      def show
        @real_estate_object = RealEstateObject.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @real_estate_object in the line below:
        present(@page)
      end

    protected

      def find_all_real_estate_objects
        @real_estate_objects = RealEstateObject.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/real_estate_objects").first
      end

    end
  end
end
