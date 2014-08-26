require 'active_record'
require 'cashier'
require 'customer'
require 'product'
require 'purchase'
require 'sale'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['test']
ActiveRecord::Base.establish_connection(development_configuration)

RSpec.configure do |config|
  config.after(:each) do
    Cashier.all.each {|cashier| cashier.destroy}
    Customer.all.each {|customer| customer.destroy}
    Product.all.each {|product| product.destroy}
    Purchase.all.each {|purchase| purchase.destroy}
    Sale.all.each {|sale| sale.destroy}
  end
end
