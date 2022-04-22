class Customer < ApplicationRecord
  validates :email, email: true
end
