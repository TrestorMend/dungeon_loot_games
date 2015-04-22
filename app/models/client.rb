class Client < ActiveRecord::Base
  belongs_to :province
  has_many :orders
end
