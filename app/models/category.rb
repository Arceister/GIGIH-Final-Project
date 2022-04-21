class Category < ApplicationRecord
  has_many :menu_categories
  has_many :foods, through: :menu_categories
end
