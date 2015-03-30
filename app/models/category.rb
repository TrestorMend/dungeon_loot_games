class Category < ActiveRecord::Base
  validates :description, presence: true
  
  has_many :products
end
