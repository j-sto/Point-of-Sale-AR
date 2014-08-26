require 'active_record'
require './lib/cashier'
require './lib/customer'
require './lib/product'
require './lib/purchase'
require './lib/sale'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def main_menu
  system("clear")
  puts "1: New cashier"
  puts "2: New product"
  puts "3: New purchase"
  main_menu_choice = gets.chomp
  case main_menu_choice
  when "1"
    new_cashier
  when "2"
    new_product
  when "3"
    new_purchase
  else
    puts "Not a valid choice"
  end
  sleep(1)
  main_menu
end


def new_cashier
  system("clear")
  puts "New Cashier Username:"
  new_cashier_username = gets.chomp
  Cashier.create({:username => new_cashier_username})
end

def new_product
  system("clear")
  puts "New Product Name:"
  new_product_name = gets.chomp
  puts "Price of #{new_product_name}:"
  new_product_cost = gets.chomp
  Product.create({:name => new_product_name, :price => new_product_cost})
end

def new_purchase
  system("clear")
  puts "Welcome to the cashier register. Please login with employee username. Choose from the list below:"
  puts "\n"
  Cashier.all.each { |c| puts c.username }
  puts "\n"
  puts "Type in the correct username"
  username = gets.chomp
  current_cashier = Cashier.find_by(username: username)
  puts "Please enter the full name of the customer making the purchase."
  new_customer_name = gets.chomp
  current_customer = Customer.create({:name => new_customer_name})
  new_sale = Sale.create({customer_id: current_customer.id, cashier_id: current_cashier.id})
  current_customer.sales << new_sale
  current_cashier.sales << new_sale
  loop do
    system ("clear")
    puts "Here is a list of products for sale."
    puts "\n"
    Product.all.each { |p| puts p.name}
    puts "\n"
    puts "Type in the name of the product that you would like to purchase"
    user_choice = gets.chomp
    selected_product = Product.find_by(name: user_choice)
    puts "Products Added!"
    sleep(1.0)
    puts "How many of these do you want to purchase?"
    quantity_choice = gets.chomp
    current_purchase = Purchase.create({:quantity => quantity_choice})
    new_sale.purchases << current_purchase
    selected_product.purchases << current_purchase
    puts "Puts this purchase is complete"
    sleep (1.0)
    puts "\n"
    puts "press 'c' to checkout, press 'a' to add another product to this sale"
    user_input = gets.chomp
    if user_input == 'c'
      check_out(new_sale)
    end
  end
end

def check_out(current_sale)
  puts current_sale
end

main_menu
