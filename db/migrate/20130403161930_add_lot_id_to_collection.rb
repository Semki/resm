class AddLotIdToCollection < ActiveRecord::Migration
  def change
    add_column :refinery_resm_collections, :lot_id, :integer
    add_index :refinery_resm_collections, [:lot_id]
  end
end
