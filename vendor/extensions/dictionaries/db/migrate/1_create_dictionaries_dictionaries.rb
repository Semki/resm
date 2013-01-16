class CreateDictionariesDictionaries < ActiveRecord::Migration

  def up
    create_table :refinery_dictionaries do |t|
      t.string :classname
      t.datetime :createdon
      t.string :name
      t.string :localname
      t.references :parent
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