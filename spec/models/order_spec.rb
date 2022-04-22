require 'rails_helper'

RSpec.describe Order, type: :model do
  it "is a valid format with customer_id" do
    customer = FactoryBot.create(:customer)
    order = FactoryBot.build(:order, customer: customer)
  end
end
