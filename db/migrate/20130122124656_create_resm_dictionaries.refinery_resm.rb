# This migration comes from refinery_resm (originally 3)
class CreateResmDictionaries < ActiveRecord::Migration

  def up
    create_table :refinery_resm_dictionaries do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end

    Refinery::Resm::Dictionary.create_translation_table! :name => :string

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-resm"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/resm/dictionaries"})
    end

    drop_table :refinery_resm_dictionaries

    Refinery::Resm::Dictionary.drop_translation_table!

  end

end
