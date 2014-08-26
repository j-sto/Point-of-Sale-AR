class Sale < ActiveRecord::Base
  belongs_to :customer
  belongs_to :cashier
  has_many :purchases
  has_many :products, through: :purchases
end
