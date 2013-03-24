module Refinery
  module Resm
    class DictionaryItemsController < ::ApplicationController

      before_filter :find_all_dictionary_items
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @dictionary_item in the line below:
        present(@page)
      end

      def show
        @dictionary_item = DictionaryItem.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @dictionary_item in the line below:
        present(@page)
      end

    protected

      def find_all_dictionary_items
        @dictionary_items = DictionaryItem.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/dictionary_items").first
      end

    end
  end
end
