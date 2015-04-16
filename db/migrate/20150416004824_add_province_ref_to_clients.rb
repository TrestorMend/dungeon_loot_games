class AddProvinceRefToClients < ActiveRecord::Migration
  def change
    add_reference :clients, :province, index: true
  end
end
