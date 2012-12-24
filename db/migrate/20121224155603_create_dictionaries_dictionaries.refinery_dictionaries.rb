# This migration comes from refinery_dictionaries (originally 1)
class CreateDictionariesDictionaries < ActiveRecord::Migration

  def up
    create_table :refinery_dictionaries do |t|
      t.string :classname
      t.string :name
      t.string :local_name
      t.references :parent_id
      t.integer :external_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-dictionaries"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/dictionaries/dictionaries"})
    end

    drop_table :refinery_dictionaries

  end

end
