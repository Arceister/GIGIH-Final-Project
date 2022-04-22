FactoryBot.define do
  factory :order do
    customer { nil }
    status { "MyString" }
    quantity { 1 }
  end
end
