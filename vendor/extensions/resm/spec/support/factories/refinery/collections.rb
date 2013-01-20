
FactoryGirl.define do
  factory :collection, :class => Refinery::Resm::Collection do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

