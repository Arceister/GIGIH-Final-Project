require 'rails_helper'

RSpec.describe Menu, type: :model do
  it 'is valid with a name and price' do
    menu = Menu.new(
      name: 'Nasi Goreng',
      description: 'Nasi di goreng',
      price: 9000.0
    )

  expect(menu).to be_valid
  end

  it "is invalid with a duplicate name" do
    menu1 = Menu.create(
      name: 'Nasi Goreng',
      description: 'Nasi di goreng',
      price: 9000.0
    )

    menu2 = Menu.new(
      name: 'Nasi Goreng',
      description: 'Nasi di tumis',
      price: 9000.0
    )
  end
end
