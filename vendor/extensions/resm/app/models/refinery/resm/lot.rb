module Refinery
  module Resm
    class Lot < Refinery::Core::BaseModel

      attr_accessible :lot_code, :group_id, :company_id, :bathscount, :bedscount, :lot_type, :category_type, :deal_type, :tenants, :tip_location, :price_sale, :price_rent_short, :rent_period_start, :rent_period_end, :price_rent_long, :invest_price, :invest_share, :geo_country, :geo_region, :geo_subregion, :geo_cantone, :geo_city, :geo_district, :building_stage, :land_density_res, :land_density_com, :accm_type, :beach_dist_lot, :beach_dist, :availability_sale, :availability_rent, :features, :pool_type, :pool_heated, :parking_type, :finishing_type, :ground_bedroom, :area_covered, :area_live, :area_plot, :area_land, :area_veranda_c, :area_veranda_u, :area_basement, :area_garden, :area_roof, :area_parking, :built_date, :built_duration, :built_deliverydate, :levels_building, :levels_lot, :gps_lat, :gps_lon, :position

      translates :lot_code

      class Translation
        attr_accessible :locale
      end

      acts_as_indexed :fields => [:lot_code]

      validates :lot_code, :presence => true, :uniqueness => true
    end
  end
end
