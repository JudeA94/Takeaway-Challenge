require 'dish'

describe Dish do
  context 'accessing attributes of a dish' do
    it 'has a name' do
      chips = Dish.new('French Fries','Deep fried thin cut potatoes',3.99, :side)
      expect(chips.name).to eq 'French Fries'
    end
    it 'has a description' do
      chips = Dish.new('French Fries','Deep fried thin cut potatoes',3.99,:side)
      expect(chips.description).to eq 'Deep fried thin cut potatoes'
    end
    it 'has a price' do
      chips = Dish.new('French Fries','Deep fried thin cut potatoes',3.99,:side)
      expect(chips.price).to eq 3.99
    end
    it 'has a category' do
      chips = Dish.new('French Fries','Deep fried thin cut potatoes',3.99,:side)
      expect(chips.category).to eq :side
    end
  end
end