require 'spec_helper'
require 'pry'

describe Purchase do
  it "should show us the sale and the proudct" do
    new_purchase = Purchase.create({:quantity => 4})
    new_product = Product.create({:name => 'apple', :price => 0.50})
    new_sale = Sale.create
    new_cashier = Cashier.create({:username => "bbing"})
    new_customer = Customer.create({:name => "steve"})
    new_cashier.sales << new_sale
    new_customer.sales << new_sale
    new_product.purchases << new_purchase
    new_sale.purchases << new_purchase
    expect(new_purchase.product).to eq new_product
    expect(new_purchase.sale).to eq new_sale
  end
end
