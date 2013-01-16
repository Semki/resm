module Refinery
  module Collections
    class CollectionsController < ::ApplicationController

      before_filter :find_all_collections
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @collection in the line below:
        present(@page)
      end

      def show
        @collection = Collection.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @collection in the line below:
        present(@page)
      end

    protected

      def find_all_collections
        @collections = Collection.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/collections").first
      end

    end
  end
end
