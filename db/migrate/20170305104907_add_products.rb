class AddProducts < ActiveRecord::Migration[5.0]
  def change
  	Product.create :title => 'Hawaiian', :description => 'This is pizza with pineapples and meat', :price => 700, :size => 40, :is_spicy => false, :is_veg => false, :is_best_offer => false, :path_to_image => '/images/hawaiian.jpg'

  	Product.create :title => 'Pepperoni', :description => 'This is pizza with pepperoni', :price => 650, :size => 40, :is_spicy => true, :is_veg => false, :is_best_offer => false, :path_to_image => '/images/pepperoni.jpg'

  	Product.create :title => 'Vegetarian', :description => 'This is pizza with vegetables', :price => 600, :size => 40, :is_spicy => false, :is_veg => true, :is_best_offer => false, :path_to_image => '/images/vegetarian.jpeg'

  	Product.create :title => 'Margherita', :description => 'This is pizza with cheese and tomato', :price => 450, :size => 40, :is_spicy => false, :is_veg => true, :is_best_offer => true, :path_to_image => '/images/margherita.jpeg'
  end
end
