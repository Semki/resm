
FactoryGirl.define do
  factory :real_estate_object, :class => Refinery::Resm::RealEstateObject do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

