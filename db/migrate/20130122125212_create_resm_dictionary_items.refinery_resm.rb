# This migration comes from refinery_resm (originally 4)
class CreateResmDictionaryItems < ActiveRecord::Migration

  def up
    create_table :refinery_resm_dictionary_items do |t|
      t.string :key
      t.string :value
      t.references :parent
      t.references :dictionary
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-resm"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/resm/dictionary_items"})
    end

    drop_table :refinery_resm_dictionary_items

  end

end
