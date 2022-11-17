require 'menu'

describe Menu do
  context 'an empty menu' do
    it 'raises error when view is called' do
      menu = Menu.new
      expect { menu.view('side') }.to raise_error 'Current menu is empty!'
    end
    it 'raises error when view_all is called' do
      menu = Menu.new
      expect { menu.view_all }.to raise_error 'Current menu is empty!'
    end
  end
  context 'menu with one item' do
    it 'view shows item' do
      menu = Menu.new
      chips = double(:dish, name: 'French Fries', description: 'Deep fried thin cut potatoes', price: 3.99, category: :Sides)
      menu.add(chips)
      expect(menu.view(:Sides)).to eq "Sides\nFrench Fries: Deep fried thin cut potatoes £3.99"
    end
  end
  context 'menu with multiple items in one category' do
    it 'view shows all corrrect items' do
      chips = double(:dish, name: 'French Fries', description: 'Deep fried thin cut potatoes', price: 3.99, category: :Sides)
      onion_rings = double(:dish, name: 'Onion Rings', description: 'Deep fried battered onion rings', price: 4.99, category: :Sides)
      menu = Menu.new
      menu.add(chips)
      menu.add(onion_rings)
      expect(menu.view(:Sides)).to eq "Sides\nFrench Fries: Deep fried thin cut potatoes £3.99\nOnion Rings: Deep fried battered onion rings £4.99"
    end
  end
  context 'a menu with one item in multiple categories' do
    it "view_all put's items sorted by category" do
      menu = Menu.new
      chips = double(:dish, name: 'French Fries', description: 'Deep fried thin cut potatoes', price: 3.99, category: :Sides)
      wings = double(:dish, name: 'Buffalo Wings', description: 'Deep fried chicken wings in a spicy sauce', price: 9.99, category: :Mains)
      menu.add(chips)
      menu.add(wings)
      expect(menu.view_all).to eq "Starters\nMains\nBuffalo Wings: Deep fried chicken wings in a spicy sauce £9.99\nSides\nFrench Fries: Deep fried thin cut potatoes £3.99\nDrinks\nDesserts"
    end
  end
  context 'a menu with multiple items in multiple categories' do
    it "view_all put's items sorted by category and displays correctly" do
      menu = Menu.new
      chips = double(:dish, name: 'French Fries', description: 'Deep fried thin cut potatoes', price: 3.99, category: :Sides)
      onion_rings = double(:dish, name: 'Onion Rings', description: 'Deep fried battered onion rings', price: 4.99, category: :Sides)
      wings = double(:dish, name: 'Buffalo Wings', description: 'Deep fried chicken wings in a spicy sauce', price: 9.99, category: :Mains)
      burger = double(:dish, name: 'Cheeseburger', description: 'Cheeseburger with lettuce onion and tomato', price: 12.99, category: :Mains)
      menu.add(chips)
      menu.add(onion_rings)
      menu.add(wings)
      menu.add(burger)
      expect(menu.view_all).to eq "Starters\nMains\nBuffalo Wings: Deep fried chicken wings in a spicy sauce £9.99\nCheeseburger: Cheeseburger with lettuce onion and tomato £12.99\nSides\nFrench Fries: Deep fried thin cut potatoes £3.99\nOnion Rings: Deep fried battered onion rings £4.99\nDrinks\nDesserts"
    end
    it 'remove deletes an item from the menu' do
      menu = Menu.new
      chips = double(:dish, name: 'French Fries', description: 'Deep fried thin cut potatoes', price: 3.99, category: :Sides)
      onion_rings = double(:dish, name: 'Onion Rings', description: 'Deep fried battered onion rings', price: 4.99, category: :Sides)
      wings = double(:dish, name: 'Buffalo Wings', description: 'Deep fried chicken wings in a spicy sauce', price: 9.99, category: :Mains)
      burger = double(:dish, name: 'Cheeseburger', description: 'Cheeseburger with lettuce onion and tomato', price: 12.99, category: :Mains)
      menu.add(chips)
      menu.add(onion_rings)
      menu.add(wings)
      menu.add(burger)
      menu.remove(burger)
      expect(menu.view_all).to eq "Starters\nMains\nBuffalo Wings: Deep fried chicken wings in a spicy sauce £9.99\nSides\nFrench Fries: Deep fried thin cut potatoes £3.99\nOnion Rings: Deep fried battered onion rings £4.99\nDrinks\nDesserts"
    end
  end
end
