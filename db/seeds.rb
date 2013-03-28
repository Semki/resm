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


dictionary = Refinery::Resm::Dictionary.create!(name: "seed dict1", key: :group_type)
Refinery::Resm::DictionaryItem.create!(name:"group_type item1", dictionary_id: dictionary.id)
Refinery::Resm::DictionaryItem.create!(name:"group_type item2", dictionary_id: dictionary.id)

dictionary2 = Refinery::Resm::Dictionary.create!(name: "seed dict2", key: :tip_location)
dictionary2.dictionary_items.create!(name:"tip_location item1")
dictionary2.dictionary_items.create!(name:"tip_location item2")

