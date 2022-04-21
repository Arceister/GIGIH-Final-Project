class Menu < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, numericality: {greater_than: 0.01}
  validates :description, length: {maximum: 150}
end
