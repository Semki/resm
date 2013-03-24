# This migration comes from refinery_resm (originally 2)
class CreateResmDictionaryItems < ActiveRecord::Migration

  def up
    create_table :refinery_resm_dictionary_items do |t|
      t.string :name
      t.integer :dictionary_id
      t.string :key
      t.integer :position

      t.timestamps
    end

    Refinery::Resm::DictionaryItem.create_translation_table! :name => :string

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-resm"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/resm/dictionary_items"})
    end

    drop_table :refinery_resm_dictionary_items

    Refinery::Resm::DictionaryItem.drop_translation_table!

  end

end
