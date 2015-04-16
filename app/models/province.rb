class Province < ActiveRecord::Base
  has_many :clients
end
