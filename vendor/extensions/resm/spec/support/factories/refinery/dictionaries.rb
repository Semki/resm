
FactoryGirl.define do
  factory :dictionary, :class => Refinery::Resm::Dictionary do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

