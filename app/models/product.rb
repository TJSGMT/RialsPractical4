class Product < ApplicationRecord
  belongs_to :user
  validates :product_name, presence: true
  validates :description, length: { minimum: 10 }
end
