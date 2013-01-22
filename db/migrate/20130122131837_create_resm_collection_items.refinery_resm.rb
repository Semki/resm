# This migration comes from refinery_resm (originally 5)
class CreateResmCollectionItems < ActiveRecord::Migration

  def up
    create_table :refinery_resm_collection_items do |t|
      t.references :collection
      t.references :dictionary_item
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
