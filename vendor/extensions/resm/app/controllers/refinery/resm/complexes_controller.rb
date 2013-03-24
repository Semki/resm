module Refinery
  module Resm
    class ComplexesController < ::ApplicationController

      before_filter :find_all_complexes
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @complex in the line below:
        present(@page)
      end

      def show
        @complex = Complex.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @complex in the line below:
        present(@page)
      end

    protected

      def find_all_complexes
        @complexes = Complex.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/complexes").first
      end

    end
  end
end
