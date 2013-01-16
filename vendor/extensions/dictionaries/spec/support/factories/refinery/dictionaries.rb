
FactoryGirl.define do
  factory :dictionary, :class => Refinery::Dictionaries::Dictionary do
    sequence(:classname) { |n| "refinery#{n}" }
  end
end

