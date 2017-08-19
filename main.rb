require 'pry'
require 'colorize'

class Main
  attr_accessor :name, :price, :calories
  def initialize(name, price, calories)
    @name = name
    @price = price
    @calories = calories
  end
end

class Side < Main
  #def initialize(name, price, calories)
    def super(name, price, calories)
    end
  #end
end

class Drink < Main
  def super(name, price, calories)
  end
end

class Order
  attr_accessor :names, :total_price, :total_calories
  def initialize
    @names = []
    @total_price = 0.0
    @total_calories = 0
  end
end

#main dishes

hamburger = Main.new("Hamburger", 3.99, 800)
cheeseburger = Main.new("Cheeseburger", 4.49, 900)
chicken_sand = Main.new('Chicken Sandwich', 4.99, 700)
main_dishes = [hamburger, cheeseburger, chicken_sand]

#sides

fries = Side.new('Fries', 1.99, 350)
salad = Side.new('Salad', 2.99, 160)
fruit = Side.new('Fruit', 0.99, 100)
sides = [fries, salad, fruit]

#Drinks

soda = Drink.new('Soda', 1.99, 400)
water = Drink.new('Water', 0.99, 0)
coffee = Drink.new('Coffee', 2.99, 10)
drinks = [soda, water, coffee]

new_order = Order.new


def menu(dish_type, new_order)
  user_select = 0
  while user_select != -1
    puts 'Press the number of your selection, or press 0 to go to the next menu'
    dish_type.each_with_index do |element, index|
      print "#{index + 1}\) #{element.name.ljust(20)}"
      print "\$#{element.price}".green
      puts "\t#{element.calories} calories".yellow
    end
    user_select = gets.to_i - 1
    if user_select >= 0 && user_select <= dish_type.length-1
      new_order.names << dish_type[user_select].name
      new_order.total_price += dish_type[user_select].price
      new_order.total_calories += dish_type[user_select].calories
    elsif user_select == -1
    else
      puts "invalid selection"
    end
  end
end

def welcome
  puts "Welcome to the Devpoint Cafeteria!"
end
def total(new_order)
  puts "You ordered #{new_order.names.join(', ')}"
  puts "Your total is \$#{new_order.total_price}".green
  puts "Your calorie count is #{new_order.total_calories}".yellow
end

welcome
menu(main_dishes, new_order)
menu(sides, new_order)
menu(drinks, new_order)
total(new_order)
