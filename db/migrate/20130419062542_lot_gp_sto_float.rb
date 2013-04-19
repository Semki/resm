class LotGpStoFloat < ActiveRecord::Migration
  def up
    change_column :refinery_resm_lots, :gps_lat, :float
    change_column :refinery_resm_lots, :gps_lon, :float
  end

  def down
    change_column :refinery_resm_lots, :gps_lat, :integer
    change_column :refinery_resm_lots, :gps_lon, :integer
  end
end
