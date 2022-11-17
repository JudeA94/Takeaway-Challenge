class Receipt
  def initialize(order)
    @order = order.list
    @service = 0.125
  end

  def view
    raise 'Receipt empty' if @order.empty?

    itemised = []
    @order.each do |dish|
      itemised << "#{dish.name}: £#{dish.price}"
    end
    end_of_bill(itemised)
  end

  def calculate_service
    raise 'Receipt empty' if @order.empty?

    (total * @service).round(2)
  end

  def total
    raise 'Receipt empty' if @order.empty?

    total = 0
    @order.each do |dish|
      total += dish.price
    end
    total
  end

  def total_with_service
    raise 'Receipt empty' if @order.empty?

    total + calculate_service
  end

  def adjust_tip(percentage)
    raise 'Receipt empty' if @order.empty?

    @service = (percentage / 100.0)
    total * @service
  end

  def confirm_by_text(number)
    raise 'Receipt empty' if @order.empty?
    text = Text.new
    text.send(number)
  end

  private

  def end_of_bill(itemised)
    itemised << "Service Charge: £#{calculate_service}"
    itemised << "Total: £#{total_with_service}"
    itemised.join("\n")
  end
end
