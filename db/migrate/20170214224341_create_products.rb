class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|

    	t.string :product_code
    	t.integer :cost
    	t.string :owner
    	t.integer :depot_id

      t.timestamps null: false
    end
  end
end
