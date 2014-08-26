require 'spec_helper'
require 'pry'

describe Cashier do
  it "has many sales" do
    new_cashier = Cashier.create({:username => "bbing"})
    new_customer = Customer.create({:name => "steve"})
    new_sale1 = Sale.create
    new_cashier.sales << new_sale1
    new_customer.sales << new_sale1
    expect(new_cashier.sales).to eq [new_sale1]
  end
end
