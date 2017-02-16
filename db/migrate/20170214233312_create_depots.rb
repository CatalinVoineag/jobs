class CreateDepots < ActiveRecord::Migration
  def change
    create_table :depots do |t|

    	t.string :depot_code 

      t.timestamps null: false
    end
  end
end
