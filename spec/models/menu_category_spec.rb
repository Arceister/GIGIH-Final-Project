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
  end
end
