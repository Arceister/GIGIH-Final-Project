class Customer < ApplicationRecord
  validates :email, email: true

  has_one :order
end
