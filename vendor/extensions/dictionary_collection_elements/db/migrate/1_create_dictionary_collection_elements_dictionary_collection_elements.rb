class CreateDictionaryCollectionElementsDictionaryCollectionElements < ActiveRecord::Migration

  def up
    create_table :refinery_dictionary_collection_elements do |t|
      t.references :dictionary_id
      t.references :collection_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-dictionary_collection_elements"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/dictionary_collection_elements/dictionary_collection_elements"})
    end

    drop_table :refinery_dictionary_collection_elements

  end

end
