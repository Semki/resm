# This migration comes from refinery_resm (originally 2)
class CreateResmCollections < ActiveRecord::Migration

  def up
    create_table :refinery_resm_collections do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end

    Refinery::Resm::Collection.create_translation_table! :name => :string

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-resm"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/resm/collections"})
    end

    drop_table :refinery_resm_collections

    Refinery::Resm::Collection.drop_translation_table!

  end

end
