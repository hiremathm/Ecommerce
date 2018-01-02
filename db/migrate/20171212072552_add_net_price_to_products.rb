class AddNetPriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :net_price, :integer
  end
end
