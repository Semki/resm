module Refinery
  module Resm
    class Complex < Refinery::Core::BaseModel

      attr_accessible :group_name, :group_type, :company_id, :tip_location, :price_sale_group, :invest_price_group, :invest_share_group, :geo_country, :geo_region, :geo_subregion, :geo_cantone, :geo_city, :geo_district, :building_stage_group, :land_density_res_group, :land_density_com_group, :beach_dist, :availability_group_sale, :availability_group_rent, :group_block, :features, :pool_type_group, :pool_heated_group, :parking_type_group, :parking_levels, :area_total_group, :area_basement_group, :area_garden, :area_roof, :area_parking_group, :built_date_group, :built_duration_group, :built_deliverydate_group, :levels_building, :levels_lot, :gps_lat_group, :gps_lon_group, :position

      translates :group_name

      class Translation
        attr_accessible :locale
      end

      acts_as_indexed :fields => [:group_name]

      validates :group_name, :presence => true, :uniqueness => true
    end
  end
end
