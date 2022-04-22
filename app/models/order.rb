class Order < ApplicationRecord
  belongs_to :customer

  has_many :order_menus
  has_many :menus, through: :order_menus
end
