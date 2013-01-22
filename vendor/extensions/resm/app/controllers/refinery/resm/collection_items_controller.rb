module Refinery
  module Resm
    class CollectionItemsController < ::ApplicationController

      before_filter :find_all_collection_items
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @collection_item in the line below:
        present(@page)
      end

      def show
        @collection_item = CollectionItem.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @collection_item in the line below:
        present(@page)
      end

    protected

      def find_all_collection_items
        @collection_items = CollectionItem.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/collection_items").first
      end

    end
  end
end
