require 'order'

describe Order do
  context 'an empty order' do
    it 'raises error when view is called' do
      order = Order.new
      expect { order.view }.to raise_error 'Current order is empty!'
    end
  end
  context 'with one item' do
    it 'views item name' do
      chips = double(:dish, name: 'French Fries', description: 'Deep fried thin cut potatoes', price: 3.99,
                            category: :Sides)
      order = Order.new
      order.add(chips, 1)
      expect(order.view).to eq 'French Fries x 1'
    end
  end
  context 'with multiple items' do
    it 'views multiple items' do
      chips = double(:dish, name: 'French Fries', description: 'Deep fried thin cut potatoes', price: 3.99,
                            category: :Sides)
      wings = double(:dish, name: 'Buffalo Wings', description: 'Deep fried chicken wings in a spicy sauce',
                            price: 9.99, category: :Mains)
      order = Order.new
      order.add(chips, 1)
      order.add(wings, 2)
      expect(order.view).to eq 'French Fries x 1, Buffalo Wings x 2'
    end
    it 'can add and remove items' do
      chips = double(:dish, name: 'French Fries', description: 'Deep fried thin cut potatoes', price: 3.99,
                            category: :Sides)
      wings = double(:dish, name: 'Buffalo Wings', description: 'Deep fried chicken wings in a spicy sauce',
                            price: 9.99, category: :Mains)
      order = Order.new
      order.add(chips, 1)
      order.add(wings, 1)
      order.remove(wings, 1)
      expect(order.view).to eq 'French Fries x 1'
    end
    it 'can add and remove multipple items at once' do
      chips = double(:dish, name: 'French Fries', description: 'Deep fried thin cut potatoes', price: 3.99,
                            category: :Sides)
      wings = double(:dish, name: 'Buffalo Wings', description: 'Deep fried chicken wings in a spicy sauce',
                            price: 9.99, category: :Mains)
      order = Order.new
      order.add(chips, 2)
      order.add(wings, 2)
      order.remove(wings, 2)
      expect(order.view).to eq 'French Fries x 2'
    end
    it 'can add and remove multiple items one by one' do
      chips = double(:dish, name: 'French Fries', description: 'Deep fried thin cut potatoes', price: 3.99,
                            category: :Sides)
      wings = double(:dish, name: 'Buffalo Wings', description: 'Deep fried chicken wings in a spicy sauce',
                            price: 9.99, category: :Mains)
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
      chips = double(:dish, name: 'French Fries', description: 'Deep fried thin cut potatoes', price: 3.99,
                            category: :Sides)
      order = Order.new
      expect { order.remove(chips, 1) }.to raise_error 'Item not on order'
    end
    it 'raises error if not that many dishes are on order' do
      chips = double(:dish, name: 'French Fries', description: 'Deep fried thin cut potatoes', price: 3.99,
                            category: :Sides)
      order = Order.new
      order.add(chips, 1)
      expect { order.remove(chips, 2) }.to raise_error 'You dont have that many of that dish on the order'
    end
  end
end
