require_relative 'dish'
require_relative 'menu'
require_relative 'order'
require_relative 'receipt'
require_relative 'text'

menu = Menu.new
chips = Dish.new('French Fries', 'Deep fried thin cut potatoes', 3.99, :Sides)
onion_rings = Dish.new('Onion Rings', 'Deep fried battered onion rings', 4.99, :Sides)
wings = Dish.new('Buffalo Wings', 'Deep fried chicken wings in a spicy sauce', 9.99, :Mains)
burger = Dish.new('Cheeseburger', 'Cheeseburger with lettuce onion and tomato', 12.99, :Mains)
menu.add(chips)
menu.add(onion_rings)
menu.add(wings)
menu.add(burger)
order = Order.new
order.add(chips,1)
receipt = Receipt.new(order)
puts receipt.view