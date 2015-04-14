class Order < ActiveRecord::Base
  belongs_to :order_status
  belongs_to :client
end
