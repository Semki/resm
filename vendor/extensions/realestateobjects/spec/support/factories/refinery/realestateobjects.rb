
FactoryGirl.define do
  factory :realestateobject, :class => Refinery::Realestateobjects::Realestateobject do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

