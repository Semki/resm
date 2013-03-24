class CreateResmComplexes < ActiveRecord::Migration

  def up
    create_table :refinery_resm_complexes do |t|
      t.string :group_name
      t.integer :group_type
      t.integer :company_id
      t.integer :tip_location
      t.integer :price_sale_group
      t.integer :invest_price_group
      t.integer :invest_share_group
      t.integer :geo_country
      t.integer :geo_region
      t.integer :geo_subregion
      t.integer :geo_cantone
      t.integer :geo_city
      t.integer :geo_district
      t.integer :building_stage_group
      t.integer :land_density_res_group
      t.integer :land_density_com_group
      t.integer :beach_dist
      t.integer :availability_group_sale
      t.integer :availability_group_rent
      t.integer :group_block
      t.integer :features
      t.integer :pool_type_group
      t.boolean :pool_heated_group
      t.integer :parking_type_group
      t.integer :parking_levels
      t.integer :area_total_group
      t.integer :area_basement_group
      t.integer :area_garden
      t.integer :area_roof
      t.integer :area_parking_group
      t.integer :built_date_group
      t.integer :built_duration_group
      t.date :built_deliverydate_group
      t.integer :levels_building
      t.integer :levels_lot
      t.integer :gps_lat_group
      t.integer :gps_lon_group
      t.integer :position

      t.timestamps
    end

    Refinery::Resm::Complex.create_translation_table! :group_name => :string

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-resm"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/resm/complexes"})
    end

    drop_table :refinery_resm_complexes

    Refinery::Resm::Complex.drop_translation_table!

  end

end
