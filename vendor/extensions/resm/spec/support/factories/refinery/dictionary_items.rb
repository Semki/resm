
FactoryGirl.define do
  factory :dictionary_item, :class => Refinery::Resm::DictionaryItem do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

