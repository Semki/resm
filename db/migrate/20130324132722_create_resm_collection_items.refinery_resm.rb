# This migration comes from refinery_resm (originally 6)
class CreateResmCollectionItems < ActiveRecord::Migration

  def up
    create_table :refinery_resm_collection_items do |t|
      t.integer :dictionary_item_id
      t.integer :collection_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-resm"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/resm/collection_items"})
    end

    drop_table :refinery_resm_collection_items

  end

end
