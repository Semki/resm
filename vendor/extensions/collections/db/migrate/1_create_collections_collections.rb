class CreateCollectionsCollections < ActiveRecord::Migration

  def up
    create_table :refinery_collections do |t|
      t.string :tag
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-collections"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/collections/collections"})
    end

    drop_table :refinery_collections

  end

end
