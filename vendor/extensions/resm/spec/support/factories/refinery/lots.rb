
FactoryGirl.define do
  factory :lot, :class => Refinery::Resm::Lot do
    sequence(:lot_code) { |n| "refinery#{n}" }
  end
end

