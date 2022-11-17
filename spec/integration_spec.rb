require 'dish'
require 'menu'
require 'order'
require 'receipt'

describe Menu do
  context 'menu with one item' do
    it 'view shows item' do
      menu = Menu.new
      chips = Dish.new('French Fries', 'Deep fried thin cut potatoes', 3.99, :Sides)
      menu.add(chips)
      expect(menu.view(:Sides)).to eq "Sides\nFrench Fries: Deep fried thin cut potatoes £3.99"
    end
  end
  context 'menu with multiple items in one category' do
    it 'view shows all corrrect items' do
      chips = Dish.new('French Fries', 'Deep fried thin cut potatoes', 3.99, :Sides)
      onion_rings = Dish.new('Onion Rings', 'Deep fried battered onion rings', 4.99, :Sides)
      menu = Menu.new
      menu.add(chips)
      menu.add(onion_rings)
      expect(menu.view(:Sides)).to eq "Sides\nFrench Fries: Deep fried thin cut potatoes £3.99\nOnion Rings: Deep fried battered onion rings £4.99"
    end
  end
  context 'a menu with one item in multiple categories' do
    it "view_all put's items sorted by category" do
      menu = Menu.new
      chips = Dish.new('French Fries', 'Deep fried thin cut potatoes', 3.99, :Sides)
      wings = Dish.new('Buffalo Wings', 'Deep fried chicken wings in a spicy sauce', 9.99, :Mains)
      menu.add(chips)
      menu.add(wings)
      expect(menu.view_all).to eq "Starters\nMains\nBuffalo Wings: Deep fried chicken wings in a spicy sauce £9.99\nSides\nFrench Fries: Deep fried thin cut potatoes £3.99\nDrinks\nDesserts"
    end
  end
  context 'a menu with multiple items in multiple categories' do
    it "view_all put's items sorted by category and displays correctly" do
      menu = Menu.new
      chips = Dish.new('French Fries', 'Deep fried thin cut potatoes', 3.99, :Sides)
      onion_rings = Dish.new('Onion Rings', 'Deep fried battered onion rings', 4.99, :Sides)
      wings = Dish.new('Buffalo Wings', 'Deep fried chicken wings in a spicy sauce', 9.99, :Mains)
      burger = Dish.new('Cheeseburger', 'Cheeseburger with lettuce onion and tomato', 12.99, :Mains)
      menu.add(chips)
      menu.add(onion_rings)
      menu.add(wings)
      menu.add(burger)
      expect(menu.view_all).to eq "Starters\nMains\nBuffalo Wings: Deep fried chicken wings in a spicy sauce £9.99\nCheeseburger: Cheeseburger with lettuce onion and tomato £12.99\nSides\nFrench Fries: Deep fried thin cut potatoes £3.99\nOnion Rings: Deep fried battered onion rings £4.99\nDrinks\nDesserts"
    end
    it 'remove deletes an item from the menu' do
      menu = Menu.new
      chips = Dish.new('French Fries', 'Deep fried thin cut potatoes', 3.99, :Sides)
      onion_rings = Dish.new('Onion Rings', 'Deep fried battered onion rings', 4.99, :Sides)
      wings = Dish.new('Buffalo Wings', 'Deep fried chicken wings in a spicy sauce', 9.99, :Mains)
      burger = Dish.new('Cheeseburger', 'Cheeseburger with lettuce onion and tomato', 12.99, :Mains)
      menu.add(chips)
      menu.add(onion_rings)
      menu.add(wings)
      menu.add(burger)
      menu.remove(burger)
      expect(menu.view_all).to eq "Starters\nMains\nBuffalo Wings: Deep fried chicken wings in a spicy sauce £9.99\nSides\nFrench Fries: Deep fried thin cut potatoes £3.99\nOnion Rings: Deep fried battered onion rings £4.99\nDrinks\nDesserts"
    end
  end
end

describe Order do
  context 'with one item' do
    it 'views item name' do
      chips = Dish.new('French Fries', 'Deep fried thin cut potatoes', 3.99, 'side')
      order = Order.new
      order.add(chips, 1)
      expect(order.view).to eq 'French Fries x 1'
    end
  end
  context 'with multiple items' do
    it 'views multiple items' do
      chips = Dish.new('French Fries', 'Deep fried thin cut potatoes', 3.99, 'side')
      wings = Dish.new('Buffalo Wings', 'Deep fried chicken wings in a spicy sauce', 9.99, 'main')
      order = Order.new
      order.add(chips, 1)
      order.add(wings, 2)
      expect(order.view).to eq 'French Fries x 1, Buffalo Wings x 2'
    end
    it 'can add and remove items' do
      chips = Dish.new('French Fries', 'Deep fried thin cut potatoes', 3.99, 'side')
      wings = Dish.new('Buffalo Wings', 'Deep fried chicken wings in a spicy sauce', 9.99, 'main')
      order = Order.new
      order.add(chips, 1)
      order.add(wings, 1)
      order.remove(wings, 1)
      expect(order.view).to eq 'French Fries x 1'
    end
    it 'can add and remove multipple items at once' do
      chips = Dish.new('French Fries', 'Deep fried thin cut potatoes', 3.99, 'side')
      wings = Dish.new('Buffalo Wings', 'Deep fried chicken wings in a spicy sauce', 9.99, 'main')
      order = Order.new
      order.add(chips, 2)
      order.add(wings, 2)
      order.remove(wings, 2)
      expect(order.view).to eq 'French Fries x 2'
    end
    it 'can add and remove multiple items one by one' do
      chips = Dish.new('French Fries', 'Deep fried thin cut potatoes', 3.99, 'side')
      wings = Dish.new('Buffalo Wings', 'Deep fried chicken wings in a spicy sauce', 9.99, 'main')
      order = Order.new
      order.add(chips, 2)
      order.add(wings, 2)
      order.remove(wings, 1)
      order.remove(chips, 2)
      expect(order.view).to eq 'Buffalo Wings x 1'
    end
  end
  context 'removing dishes not on order' do
    it "raises error if dish isn't on order" do
      chips = Dish.new('French Fries', 'Deep fried thin cut potatoes', 3.99, 'side')
      order = Order.new
      expect { order.remove(chips, 1) }.to raise_error 'Item not on order'
    end
    it 'raises error if not that many dishes are on order' do
      chips = Dish.new('French Fries', 'Deep fried thin cut potatoes', 3.99, 'side')
      order = Order.new
      order.add(chips, 1)
      expect { order.remove(chips, 2) }.to raise_error 'You dont have that many of that dish on the order'
    end
  end
end

describe Receipt do
  context 'with order list containing dishes' do
    it 'view shows itemised bill' do
      chips = Dish.new('French Fries', 'Deep fried thin cut potatoes', 3.99, 'side')
      wings = Dish.new('Buffalo Wings', 'Deep fried chicken wings in a spicy sauce', 9.99, 'main')
      order = Order.new
      order.add(chips, 1)
      order.add(wings, 1)
      receipt = Receipt.new(order)
      expect(receipt.view).to eq "French Fries: £3.99\nBuffalo Wings: £9.99\nService Charge: £1.75\nTotal: £15.73"
    end

    it 'total gives total cost excluding sevice charge' do
      chips = Dish.new('French Fries', 'Deep fried thin cut potatoes', 3.99, 'side')
      wings = Dish.new('Buffalo Wings', 'Deep fried chicken wings in a spicy sauce', 9.99, 'main')
      order = Order.new
      order.add(chips, 2)
      order.add(wings, 1)
      receipt = Receipt.new(order)
      expect(receipt.total).to eq 17.97
    end
    it 'total_with_service gives total cost including sevice charge' do
      chips = Dish.new('French Fries', 'Deep fried thin cut potatoes', 3.99, 'side')
      wings = Dish.new('Buffalo Wings', 'Deep fried chicken wings in a spicy sauce', 9.99, 'main')
      order = Order.new
      order.add(chips, 2)
      order.add(wings, 1)
      receipt = Receipt.new(order)
      expect(receipt.total_with_service).to eq 20.22
    end
    it 'adjust_tip changes tip percentage' do
      chips = Dish.new('French Fries', 'Deep fried thin cut potatoes', 3.99, 'side')
      wings = Dish.new('Buffalo Wings', 'Deep fried chicken wings in a spicy sauce', 9.99, 'main')
      order = Order.new
      order.add(chips, 1)
      order.add(wings, 1)
      receipt = Receipt.new(order)
      receipt.adjust_tip(10)
      expect(receipt.total_with_service).to eq 15.38
    end
  end
  context 'an empty order' do
    it 'raises error when is view called' do
      order_list = Order.new
      receipt = Receipt.new(order_list)
      expect { receipt.view }.to raise_error 'Receipt empty'
    end
    it 'raises error when is total called' do
      order_list = Order.new
      receipt = Receipt.new(order_list)
      expect { receipt.total }.to raise_error 'Receipt empty'
    end
    it 'raises error when is total_with_service called' do
      order_list = Order.new
      receipt = Receipt.new(order_list)
      expect { receipt.total_with_service }.to raise_error 'Receipt empty'
    end
    it 'raises error when is calculate_service called' do
      order_list = Order.new
      receipt = Receipt.new(order_list)
      expect { receipt.calculate_service }.to raise_error 'Receipt empty'
    end
    it 'raises error when is adjust_tip called' do
      order_list = Order.new
      receipt = Receipt.new(order_list)
      expect { receipt.adjust_tip(10) }.to raise_error 'Receipt empty'
    end
    it 'raises error when is confirm_by_text called' do
      order_list = Order.new
      receipt = Receipt.new(order_list)
      expect { receipt.confirm_by_text(888) }.to raise_error 'Receipt empty'
    end
  end
  context 'confirm_by_text' do
    xit 'sends a text to let the customer know delivery time' do
      #This has been manually tested
      chips = Dish.new('French Fries', 'Deep fried thin cut potatoes', 3.99, 'side')
      wings = Dish.new('Buffalo Wings', 'Deep fried chicken wings in a spicy sauce', 9.99, 'main')
      order = Order.new
      order.add(chips, 1)
      order.add(wings, 1)
      receipt = Receipt.new(order)
      expect(receipt.confirm_by_text).to eq 'Thank you! Your order was placed and will be delivered before Time.now + 20 mins'
    end
  end
end
