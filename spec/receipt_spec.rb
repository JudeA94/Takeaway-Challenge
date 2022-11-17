require 'receipt'

describe Receipt do
  context 'with order list containing dishes' do
    it 'view shows itemised bill' do
      chips = double(:dish, name: 'French Fries', description: 'Deep fried thin cut potatoes', price: 3.99,
                            category: :Sides)
      wings = double(:dish, name: 'Buffalo Wings', description: 'Deep fried chicken wings in a spicy sauce',
                            price: 9.99, category: :Mains)
      order = double(:order)
      expect(order).to receive(:add).with(chips, 1)
      expect(order).to receive(:add).with(wings, 1)
      expect(order).to receive(:list).and_return([chips, wings])
      order.add(chips, 1)
      order.add(wings, 1)
      receipt = Receipt.new(order)
      expect(receipt.view).to eq "French Fries: £3.99\nBuffalo Wings: £9.99\nService Charge: £1.75\nTotal: £15.73"
    end
    it 'total gives total cost excluding sevice charge' do
      chips = double(:dish, name: 'French Fries', description: 'Deep fried thin cut potatoes', price: 3.99,
                            category: :Sides)
      wings = double(:dish, name: 'Buffalo Wings', description: 'Deep fried chicken wings in a spicy sauce',
                            price: 9.99, category: :Mains)
      order = Order.new
      order.add(chips, 2)
      order.add(wings, 1)
      receipt = Receipt.new(order)
      expect(receipt.total).to eq 17.97
    end
    it 'total_with_service gives total cost including sevice charge' do
      chips = double(:dish, name: 'French Fries', description: 'Deep fried thin cut potatoes', price: 3.99,
                            category: :Sides)
      wings = double(:dish, name: 'Buffalo Wings', description: 'Deep fried chicken wings in a spicy sauce',
                            price: 9.99, category: :Mains)
      order = double(:order)
      expect(order).to receive(:add).with(chips, 2)
      expect(order).to receive(:add).with(wings, 1)
      expect(order).to receive(:list).and_return([chips, chips, wings])
      order.add(chips, 2)
      order.add(wings, 1)
      receipt = Receipt.new(order)
      expect(receipt.total_with_service).to eq 20.22
    end
    it 'adjust_tip changes tip percentage' do
      chips = double(:dish, name: 'French Fries', description: 'Deep fried thin cut potatoes', price: 3.99,
                            category: :Sides)
      wings = Dish.new('Buffalo Wings', 'Deep fried chicken wings in a spicy sauce', 9.99, 'main')
      order = double(:order)
      expect(order).to receive(:add).with(chips, 1)
      expect(order).to receive(:add).with(wings, 1)
      expect(order).to receive(:list).and_return([chips, wings])
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
end
