class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.string :name
    	t.integer :price 
    	t.integer :stock
    	t.integer :category_id
    	t.text :description
    	t.boolean :cod_eligible
    	t.date :release_date
    	t.string :image_url
      t.timestamps null: false
    end
  end
end
