FactoryBot.define do
  factory :floor_plan do
    sequence(:community) { |n| "Community #{n}" }
    sequence(:name) { |n| "Community #{n}" }
    beds { 2 }
    baths { 2 }
    sq_ft { 904 }
  end
end
