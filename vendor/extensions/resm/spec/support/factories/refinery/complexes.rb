
FactoryGirl.define do
  factory :complex, :class => Refinery::Resm::Complex do
    sequence(:group_name) { |n| "refinery#{n}" }
  end
end

