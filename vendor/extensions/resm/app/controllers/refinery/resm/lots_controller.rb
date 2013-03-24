module Refinery
  module Resm
    class LotsController < ::ApplicationController

      before_filter :find_all_lots
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @lot in the line below:
        present(@page)
      end

      def show
        @lot = Lot.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @lot in the line below:
        present(@page)
      end

    protected

      def find_all_lots
        @lots = Lot.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/lots").first
      end

    end
  end
end
