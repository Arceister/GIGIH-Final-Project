require 'rails_helper'

RSpec.describe MenuCategory, type: :model do
  it "is valid with at least one category" do
    category = Category.create(name: 'Indonesian')

    menu = Menu.create(
      name: 'Nasi Goreng',
      description: 'Nasi di goreng',
      price: 9000.0,
      categories: [category]
    )

    expect(menu.categories.length).to be >= 1
  end

  it "is valid with more than one category" do
    c1 = Category.create(name: 'Indonesian')
    c2 = Category.create(name: 'Fried Food')

    menu = Menu.create(
      name: 'Nasi Goreng',
      description: 'Nasi di goreng',
      price: 9000.0,
      categories: [c1, c2]
    )

    expect(menu.categories.length).to be > 1
  end
end
