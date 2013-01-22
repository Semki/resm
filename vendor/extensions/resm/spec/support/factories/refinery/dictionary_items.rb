
FactoryGirl.define do
  factory :dictionary_item, :class => Refinery::Resm::DictionaryItem do
    sequence(:key) { |n| "refinery#{n}" }
  end
end

