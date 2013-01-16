module Refinery
  module DictionaryCollectionElements
    class DictionaryCollectionElementsController < ::ApplicationController

      before_filter :find_all_dictionary_collection_elements
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @dictionary_collection_element in the line below:
        present(@page)
      end

      def show
        @dictionary_collection_element = DictionaryCollectionElement.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @dictionary_collection_element in the line below:
        present(@page)
      end

    protected

      def find_all_dictionary_collection_elements
        @dictionary_collection_elements = DictionaryCollectionElement.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/dictionary_collection_elements").first
      end

    end
  end
end
