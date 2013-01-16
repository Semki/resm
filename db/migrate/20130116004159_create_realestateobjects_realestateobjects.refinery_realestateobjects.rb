# This migration comes from refinery_realestateobjects (originally 1)
class CreateRealestateobjectsRealestateobjects < ActiveRecord::Migration

  def up
    create_table :refinery_realestateobjects do |t|
      t.references :complex
      t.references :collection
      t.string :name
      t.integer :status
      t.decimal :price
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-realestateobjects"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/realestateobjects/realestateobjects"})
    end

    drop_table :refinery_realestateobjects

  end

end