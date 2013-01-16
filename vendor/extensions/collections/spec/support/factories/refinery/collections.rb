
FactoryGirl.define do
  factory :collection, :class => Refinery::Collections::Collection do
    sequence(:tag) { |n| "refinery#{n}" }
  end
end

