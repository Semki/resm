module Refinery
  module Resm
    module Admin
      class LotsController < ::Refinery::AdminController

        before_filter :prepare_features#, only: [:new, :edit, :show]
        around_filter :generate_collection, only: [:create, :update]

        crudify :'refinery/resm/lot',
                :title_attribute => 'lot_code', :xhr_paging => true

        helper_method :get_items_by_dictionary

        def get_items_by_dictionary(key)
          Refinery::Resm::Dictionary.get_items_by_key(key)
        end

        def get_dictionary_items
          dictionary = Refinery::Resm::Dictionary.find(params[:dictionary_id])
          dictionary_items = dictionary.dictionary_items
          respond_to do |format|
            format.json  { render :json => dictionary_items }
          end
        end

        def prepare_features
          @dictionaries = Refinery::Resm::Dictionary.all(include: :dictionary_items)
        end

        def generate_collection

          yield

          dictionary_items = []
          if params.has_key?(:collection_items)
            params[:collection_items].each_value do |dictionary_id|
              dictionary_item = nil
              dictionary_item = Refinery::Resm::DictionaryItem.find(dictionary_id) unless dictionary_id.nil?
              dictionary_items << dictionary_item unless dictionary_item.nil?
            end
          end

          @lot.collection ||= @lot.build_collection({name: "collection for #{@lot.lot_code}"})
          @lot.collection.collection_items.clear

          dictionary_items.each do |dictionary_item|
            puts "build from #{dictionary_item} with id #{dictionary_item.id}"
            @lot.collection.collection_items.create!({dictionary_item_id: dictionary_item.id})
          end
          puts "collection: #{@lot.collection.collection_items}"
        end

      end
    end
  end
end
