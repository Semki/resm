# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

# Added by Refinery CMS Collections extension
Refinery::Resm::Engine.load_seed

Refinery::Resm::DictionaryItem.delete_all
Refinery::Resm::Dictionary.destroy_all


dictionary = Refinery::Resm::Dictionary.create!(name: "accm type", key: :accm_type)
Refinery::Resm::DictionaryItem.create!(name:"children", dictionary_id: dictionary.id)
Refinery::Resm::DictionaryItem.create!(name:"adult", dictionary_id: dictionary.id)
Refinery::Resm::DictionaryItem.create!(name:"infant", dictionary_id: dictionary.id)

dictionary2 = Refinery::Resm::Dictionary.create!(name: "tip location", key: :tip_location)
dictionary2.dictionary_items.create!(name:"zone center")
dictionary2.dictionary_items.create!(name:"close to beach")
dictionary2.dictionary_items.create!(name:"shops are near")

dictionary3 = Refinery::Resm::Dictionary.create!(name: "category type", key: :category_type)
dictionary3.dictionary_items.create!(name:"ressellers")
dictionary3.dictionary_items.create!(name:"new")
dictionary3.dictionary_items.create!(name:"from bank")

dictionary3 = Refinery::Resm::Dictionary.create!(name: "deal type", key: :deal_type)
dictionary3.dictionary_items.create!(name:"sale")
dictionary3.dictionary_items.create!(name:"investments")
dictionary3.dictionary_items.create!(name:"rent")
dictionary3.dictionary_items.create!(name:"occupancy")

dictionary3 = Refinery::Resm::Dictionary.create!(name: "item type", key: :item_type)
dictionary3.dictionary_items.create!(name:"office")
dictionary3.dictionary_items.create!(name:"building")
dictionary3.dictionary_items.create!(name:"villa")
dictionary3.dictionary_items.create!(name:"maisonette")
dictionary3.dictionary_items.create!(name:"appartments")

dictionary3 = Refinery::Resm::Dictionary.create!(name: "building stage", key: :building_stage)
dictionary3.dictionary_items.create!(name:"project")
dictionary3.dictionary_items.create!(name:"foundaments")
dictionary3.dictionary_items.create!(name:"walls")
dictionary3.dictionary_items.create!(name:"roof")
dictionary3.dictionary_items.create!(name:"finishing")

dictionary3 = Refinery::Resm::Dictionary.create!(name: "availability", key: :availability)
dictionary3.dictionary_items.create!(name:"free")
dictionary3.dictionary_items.create!(name:"reserved")
dictionary3.dictionary_items.create!(name:"sold")

dictionary3 = Refinery::Resm::Dictionary.create!(name: "pool type", key: :pool_type)
dictionary3.dictionary_items.create!(name:"general")
dictionary3.dictionary_items.create!(name:"private")
dictionary3.dictionary_items.create!(name:"child")
dictionary3.dictionary_items.create!(name:"sport")

dictionary3 = Refinery::Resm::Dictionary.create!(name: "parking type", key: :parking_type)
dictionary3.dictionary_items.create!(name:"open")
dictionary3.dictionary_items.create!(name:"covered")
dictionary3.dictionary_items.create!(name:"undeground")
dictionary3.dictionary_items.create!(name:"garage")

dictionary3 = Refinery::Resm::Dictionary.create!(name: "finishing type", key: :finishing_type)
dictionary3.dictionary_items.create!(name:"for finishing")
dictionary3.dictionary_items.create!(name:"finishing done")
dictionary3.dictionary_items.create!(name:"renovated")

dictionary3 = Refinery::Resm::Dictionary.create!(name: "availability rent", key: :availability_rent)
dictionary3.dictionary_items.create!(name:"rent is available")
dictionary3.dictionary_items.create!(name:"rent is not available")

dictionary3 = Refinery::Resm::Dictionary.create!(name: "availability sale", key: :availability_sale)
dictionary3.dictionary_items.create!(name:"sale is available")
dictionary3.dictionary_items.create!(name:"sale is not available")

dictionary3 = Refinery::Resm::Dictionary.create!(name: "lot type", key: :lot_type)
dictionary3.dictionary_items.create!(name:"undefined")

dictionary3 = Refinery::Resm::Dictionary.create!(name: "geo country", key: :geo_country)
dictionary3.dictionary_items.create!(name:"Cyprus")


dictionary3 = Refinery::Resm::Dictionary.create!(name: "features", key: :features)
dictionary3.dictionary_items.create!(name:"sea view")
dictionary3.dictionary_items.create!(name:"balcony")
dictionary3.dictionary_items.create!(name:"terrace")
dictionary3.dictionary_items.create!(name:"sauna")
dictionary3.dictionary_items.create!(name:"outdoor jakuzzi")
dictionary3.dictionary_items.create!(name:"free wi-fi")

