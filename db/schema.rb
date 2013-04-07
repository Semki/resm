# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130403161930) do

  create_table "refinery_images", :force => true do |t|
    t.string   "image_mime_type"
    t.string   "image_name"
    t.integer  "image_size"
    t.integer  "image_width"
    t.integer  "image_height"
    t.string   "image_uid"
    t.string   "image_ext"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "refinery_page_part_translations", :force => true do |t|
    t.integer  "refinery_page_part_id"
    t.string   "locale"
    t.text     "body"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "refinery_page_part_translations", ["locale"], :name => "index_refinery_page_part_translations_on_locale"
  add_index "refinery_page_part_translations", ["refinery_page_part_id"], :name => "index_f9716c4215584edbca2557e32706a5ae084a15ef"

  create_table "refinery_page_parts", :force => true do |t|
    t.integer  "refinery_page_id"
    t.string   "title"
    t.text     "body"
    t.integer  "position"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "refinery_page_parts", ["id"], :name => "index_refinery_page_parts_on_id"
  add_index "refinery_page_parts", ["refinery_page_id"], :name => "index_refinery_page_parts_on_refinery_page_id"

  create_table "refinery_page_translations", :force => true do |t|
    t.integer  "refinery_page_id"
    t.string   "locale"
    t.string   "title"
    t.string   "custom_slug"
    t.string   "menu_title"
    t.string   "slug"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "refinery_page_translations", ["locale"], :name => "index_refinery_page_translations_on_locale"
  add_index "refinery_page_translations", ["refinery_page_id"], :name => "index_d079468f88bff1c6ea81573a0d019ba8bf5c2902"

  create_table "refinery_pages", :force => true do |t|
    t.integer  "parent_id"
    t.string   "path"
    t.string   "slug"
    t.boolean  "show_in_menu",        :default => true
    t.string   "link_url"
    t.string   "menu_match"
    t.boolean  "deletable",           :default => true
    t.boolean  "draft",               :default => false
    t.boolean  "skip_to_first_child", :default => false
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.string   "view_template"
    t.string   "layout_template"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "refinery_pages", ["depth"], :name => "index_refinery_pages_on_depth"
  add_index "refinery_pages", ["id"], :name => "index_refinery_pages_on_id"
  add_index "refinery_pages", ["lft"], :name => "index_refinery_pages_on_lft"
  add_index "refinery_pages", ["parent_id"], :name => "index_refinery_pages_on_parent_id"
  add_index "refinery_pages", ["rgt"], :name => "index_refinery_pages_on_rgt"

  create_table "refinery_resm_collection_items", :force => true do |t|
    t.integer  "dictionary_item_id"
    t.integer  "collection_id"
    t.integer  "position"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "refinery_resm_collection_translations", :force => true do |t|
    t.integer  "refinery_resm_collection_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "refinery_resm_collection_translations", ["locale"], :name => "index_refinery_resm_collection_translations_on_locale"
  add_index "refinery_resm_collection_translations", ["refinery_resm_collection_id"], :name => "index_54c68166e914713c8c28ce690de3d39aa1f3e1a8"

  create_table "refinery_resm_collections", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "lot_id"
  end

  add_index "refinery_resm_collections", ["lot_id"], :name => "index_refinery_resm_collections_on_lot_id"

  create_table "refinery_resm_complex_translations", :force => true do |t|
    t.integer  "refinery_resm_complex_id"
    t.string   "locale"
    t.string   "group_name"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "refinery_resm_complex_translations", ["locale"], :name => "index_refinery_resm_complex_translations_on_locale"
  add_index "refinery_resm_complex_translations", ["refinery_resm_complex_id"], :name => "index_c65c7010603cf372515c7a9dacb5b3ae8eb5727a"

  create_table "refinery_resm_complexes", :force => true do |t|
    t.string   "group_name"
    t.integer  "group_type"
    t.integer  "company_id"
    t.integer  "tip_location"
    t.integer  "price_sale_group"
    t.integer  "invest_price_group"
    t.integer  "invest_share_group"
    t.integer  "geo_country"
    t.integer  "geo_region"
    t.integer  "geo_subregion"
    t.integer  "geo_cantone"
    t.integer  "geo_city"
    t.integer  "geo_district"
    t.integer  "building_stage_group"
    t.integer  "land_density_res_group"
    t.integer  "land_density_com_group"
    t.integer  "beach_dist"
    t.integer  "availability_group_sale"
    t.integer  "availability_group_rent"
    t.integer  "group_block"
    t.integer  "features"
    t.integer  "pool_type_group"
    t.boolean  "pool_heated_group"
    t.integer  "parking_type_group"
    t.integer  "parking_levels"
    t.integer  "area_total_group"
    t.integer  "area_basement_group"
    t.integer  "area_garden"
    t.integer  "area_roof"
    t.integer  "area_parking_group"
    t.integer  "built_date_group"
    t.integer  "built_duration_group"
    t.date     "built_deliverydate_group"
    t.integer  "levels_building"
    t.integer  "levels_lot"
    t.integer  "gps_lat_group"
    t.integer  "gps_lon_group"
    t.integer  "position"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "refinery_resm_dictionaries", :force => true do |t|
    t.string   "name"
    t.string   "key"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "refinery_resm_dictionary_item_translations", :force => true do |t|
    t.integer  "refinery_resm_dictionary_item_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "refinery_resm_dictionary_item_translations", ["locale"], :name => "index_refinery_resm_dictionary_item_translations_on_locale"
  add_index "refinery_resm_dictionary_item_translations", ["refinery_resm_dictionary_item_id"], :name => "index_e88cf52fc7adc234274d2e8b5f3ec630180c79bd"

  create_table "refinery_resm_dictionary_items", :force => true do |t|
    t.string   "name"
    t.integer  "dictionary_id"
    t.string   "key"
    t.integer  "position"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "refinery_resm_dictionary_translations", :force => true do |t|
    t.integer  "refinery_resm_dictionary_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "refinery_resm_dictionary_translations", ["locale"], :name => "index_refinery_resm_dictionary_translations_on_locale"
  add_index "refinery_resm_dictionary_translations", ["refinery_resm_dictionary_id"], :name => "index_e454dbdec6985b6ec1d3d136ab4a33a48f04e783"

  create_table "refinery_resm_lot_translations", :force => true do |t|
    t.integer  "refinery_resm_lot_id"
    t.string   "locale"
    t.string   "lot_code"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "refinery_resm_lot_translations", ["locale"], :name => "index_refinery_resm_lot_translations_on_locale"
  add_index "refinery_resm_lot_translations", ["refinery_resm_lot_id"], :name => "index_842894ae13444a7824e33d512fa7f16828f1c478"

  create_table "refinery_resm_lots", :force => true do |t|
    t.string   "lot_code"
    t.integer  "group_id"
    t.integer  "company_id"
    t.integer  "bathscount"
    t.integer  "bedscount"
    t.integer  "lot_type"
    t.integer  "category_type"
    t.integer  "deal_type"
    t.integer  "tenants"
    t.integer  "tip_location"
    t.integer  "price_sale"
    t.integer  "price_rent_short"
    t.date     "rent_period_start"
    t.date     "rent_period_end"
    t.integer  "price_rent_long"
    t.integer  "invest_price"
    t.integer  "invest_share"
    t.integer  "geo_country"
    t.integer  "geo_region"
    t.integer  "geo_subregion"
    t.integer  "geo_cantone"
    t.integer  "geo_city"
    t.integer  "geo_district"
    t.integer  "building_stage"
    t.integer  "land_density_res"
    t.integer  "land_density_com"
    t.integer  "accm_type"
    t.integer  "beach_dist_lot"
    t.integer  "beach_dist"
    t.integer  "availability_sale"
    t.integer  "availability_rent"
    t.integer  "features"
    t.integer  "pool_type"
    t.boolean  "pool_heated"
    t.integer  "parking_type"
    t.integer  "finishing_type"
    t.boolean  "ground_bedroom"
    t.integer  "area_covered"
    t.integer  "area_live"
    t.integer  "area_plot"
    t.integer  "area_land"
    t.integer  "area_veranda_c"
    t.integer  "area_veranda_u"
    t.integer  "area_basement"
    t.integer  "area_garden"
    t.integer  "area_roof"
    t.integer  "area_parking"
    t.integer  "built_date"
    t.integer  "built_duration"
    t.date     "built_deliverydate"
    t.integer  "levels_building"
    t.integer  "levels_lot"
    t.integer  "gps_lat"
    t.integer  "gps_lon"
    t.integer  "position"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "refinery_resources", :force => true do |t|
    t.string   "file_mime_type"
    t.string   "file_name"
    t.integer  "file_size"
    t.string   "file_uid"
    t.string   "file_ext"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "refinery_roles", :force => true do |t|
    t.string "title"
  end

  create_table "refinery_roles_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "refinery_roles_users", ["role_id", "user_id"], :name => "index_refinery_roles_users_on_role_id_and_user_id"
  add_index "refinery_roles_users", ["user_id", "role_id"], :name => "index_refinery_roles_users_on_user_id_and_role_id"

  create_table "refinery_user_plugins", :force => true do |t|
    t.integer "user_id"
    t.string  "name"
    t.integer "position"
  end

  add_index "refinery_user_plugins", ["name"], :name => "index_refinery_user_plugins_on_name"
  add_index "refinery_user_plugins", ["user_id", "name"], :name => "index_refinery_user_plugins_on_user_id_and_name", :unique => true

  create_table "refinery_users", :force => true do |t|
    t.string   "username",               :null => false
    t.string   "email",                  :null => false
    t.string   "encrypted_password",     :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "sign_in_count"
    t.datetime "remember_created_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  add_index "refinery_users", ["id"], :name => "index_refinery_users_on_id"

  create_table "seo_meta", :force => true do |t|
    t.integer  "seo_meta_id"
    t.string   "seo_meta_type"
    t.string   "browser_title"
    t.string   "meta_keywords"
    t.text     "meta_description"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "seo_meta", ["id"], :name => "index_seo_meta_on_id"
  add_index "seo_meta", ["seo_meta_id", "seo_meta_type"], :name => "index_seo_meta_on_seo_meta_id_and_seo_meta_type"

end
