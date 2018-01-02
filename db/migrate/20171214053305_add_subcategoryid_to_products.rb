class AddSubcategoryidToProducts < ActiveRecord::Migration
  def change
    add_column :products, :sub_cat_id, :integer
  end
end
