FactoryBot.define do
  factory :order do
    customer { nil }
    status { "NEW" }
    quantity { 1 }
  end
end
