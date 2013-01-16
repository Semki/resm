# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

# Added by Refinery CMS Realestateobjects extension
Refinery::Realestateobjects::Engine.load_seed

# Added by Refinery CMS Dictionaries extension
Refinery::Dictionaries::Engine.load_seed

# Added by Refinery CMS Collections extension
Refinery::Collections::Engine.load_seed

# Added by Refinery CMS Dictionary Collection Elements extension
Refinery::DictionaryCollectionElements::Engine.load_seed
