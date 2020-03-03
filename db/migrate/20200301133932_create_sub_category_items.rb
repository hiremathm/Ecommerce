class CreateSubCategoryItems < ActiveRecord::Migration
  def change
    create_table :sub_category_items do |t|
    	t.string :name
    	t.integer :sub_category_id
      t.timestamps null: false
    end
  end
end
