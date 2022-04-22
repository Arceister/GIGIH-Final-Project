require 'rails_helper'

RSpec.describe Customer, type: :model do
  it "is a valid email format" do
    expect(FactoryBot.build(:customer)).to be_valid
  end

  it "is invalid without correct email format" do
    customer = FactoryBot.build(:customer, email: 'iniformatemailgakvalid')
    customer.valid?
    expect(customer.errors[:email]).to include("is invalid")
  end
end
