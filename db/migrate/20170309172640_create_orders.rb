class CreateOrders < ActiveRecord::Migration[5.0]
  def change
  	create_table :orders do |t|
  		t.text :order
  		t.text :name
  		t.text :phone
  		t.text :adress

  		t.timestamps 
  	end
  end
end
