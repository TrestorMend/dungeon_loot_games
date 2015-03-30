class Product < ActiveRecord::Base
  validates :name, :description, :price, :stock_quantity, presence: true
  validates :name, uniqueness: true
  validates :price, :stock_quantity, :numericality => { :greater_than_or_equal_to => 0 }
  
  belongs_to :category
end
