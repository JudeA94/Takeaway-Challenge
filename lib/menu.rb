class Menu
  def initialize
    @menu_list = []
    @categories = [:Starters,:Mains,:Sides,:Drinks,:Desserts]
  end

  def add(dish)
    @menu_list << dish
  end

  def remove(dish)
    @menu_list.delete(dish)
  end

  def view(category)
    raise "Current menu is empty!" if @menu_list.empty?
    sort_by_menu_category(category)
  end

  def view_all
    raise "Current menu is empty!" if @menu_list.empty?
    all_menu = []
    @categories.each do |category|
      all_menu << sort_by_menu_category(category)
    end
    all_menu.join("\n")
  end

  def sort_by_menu_category(category)
    menu_items = [category.to_s]
    @menu_list.each do |dish|
      if dish.category == category
        menu_items << "#{dish.name}: #{dish.description} £#{dish.price}"
      end
    end
    menu_items.join("\n")
  end
end