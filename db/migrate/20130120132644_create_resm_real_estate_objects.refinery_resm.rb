# This migration comes from refinery_resm (originally 1)
class CreateResmRealEstateObjects < ActiveRecord::Migration

  def up
    create_table :refinery_resm_real_estate_objects do |t|
      t.string :name
      t.decimal :price
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
      ::Refinery::Page.delete_all({:link_url => "/resm/real_estate_objects"})
    end

    drop_table :refinery_resm_real_estate_objects

  end

end
