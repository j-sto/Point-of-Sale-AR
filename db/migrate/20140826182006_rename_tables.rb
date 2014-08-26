class RenameTables < ActiveRecord::Migration
  def change
    rename_table :cashier, :cashiers
    rename_table :customer, :customers
  end
end
