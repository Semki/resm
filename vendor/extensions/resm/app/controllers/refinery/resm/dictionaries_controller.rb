module Refinery
  module Resm
    class DictionariesController < ::ApplicationController

      before_filter :find_all_dictionaries
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @dictionary in the line below:
        present(@page)
      end

      def show
        @dictionary = Dictionary.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @dictionary in the line below:
        present(@page)
      end

    protected

      def find_all_dictionaries
        @dictionaries = Dictionary.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/dictionaries").first
      end

    end
  end
end
