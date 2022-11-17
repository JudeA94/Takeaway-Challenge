class Order
  def initialize
    @order_list = []
  end

  def list
    @order_list
  end
    
  def add(dish, quantity)
    quantity.times do
      @order_list << dish
    end
  end

  def remove(dish, quantity)
    raise 'Item not on order' unless @order_list.include?(dish)
    raise 'You dont have that many of that dish on the order' unless @order_list.count(dish) >= quantity
    quantity.times do
      index = @order_list.find_index(dish)
      @order_list.delete_at(index)
    end
  end

  def view
    raise "Current order is empty!" if @order_list.empty?
    current_order = []
    dishes = @order_list.uniq
    dishes.each do |dish|
      current_order << "#{dish.name} x #{@order_list.count(dish)}"
    end
    current_order.join(', ')
  end
end
