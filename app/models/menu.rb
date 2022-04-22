class Menu < ApplicationRecord
  has_many :menu_categories
  has_many :order_menus
  has_many :categories, through: :menu_categories
  has_many :orders, through: :order_menus

  validates :name, presence: true, uniqueness: true
  validates :price, numericality: {greater_than: 0.01}
  validates :description, length: {maximum: 150}
end
