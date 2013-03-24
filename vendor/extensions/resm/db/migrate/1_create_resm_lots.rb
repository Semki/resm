class CreateResmLots < ActiveRecord::Migration

  def up
    create_table :refinery_resm_lots do |t|
      t.string :lot_code
      t.integer :group_id
      t.integer :company_id
      t.integer :bathscount
      t.integer :bedscount
      t.integer :lot_type
      t.integer :category_type
      t.integer :deal_type
      t.integer :tenants
      t.integer :tip_location
      t.integer :price_sale
      t.integer :price_rent_short
      t.date :rent_period_start
      t.date :rent_period_end
      t.integer :price_rent_long
      t.integer :invest_price
      t.integer :invest_share
      t.integer :geo_country
      t.integer :geo_region
      t.integer :geo_subregion
      t.integer :geo_cantone
      t.integer :geo_city
      t.integer :geo_district
      t.integer :building_stage
      t.integer :land_density_res
      t.integer :land_density_com
      t.integer :accm_type
      t.integer :beach_dist_lot
      t.integer :beach_dist
      t.integer :availability_sale
      t.integer :availability_rent
      t.integer :features
      t.integer :pool_type
      t.boolean :pool_heated
      t.integer :parking_type
      t.integer :finishing_type
      t.boolean :ground_bedroom
      t.integer :area_covered
      t.integer :area_live
      t.integer :area_plot
      t.integer :area_land
      t.integer :area_veranda_c
      t.integer :area_veranda_u
      t.integer :area_basement
      t.integer :area_garden
      t.integer :area_roof
      t.integer :area_parking
      t.integer :built_date
      t.integer :built_duration
      t.date :built_deliverydate
      t.integer :levels_building
      t.integer :levels_lot
      t.integer :gps_lat
      t.integer :gps_lon
      t.integer :position

      t.timestamps
    end

    Refinery::Resm::Lot.create_translation_table! :lot_code => :string

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-resm"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/resm/lots"})
    end

    drop_table :refinery_resm_lots

    Refinery::Resm::Lot.drop_translation_table!

  end

end
