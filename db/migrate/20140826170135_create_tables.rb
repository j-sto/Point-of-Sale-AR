class CreateTables < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.column :name, :string
      t.column :price, :float
      t.timestamps
    end

    create_table :purchases do |t|
      t.belongs_to :product
      t.belongs_to :sale
      t.column :quantity, :integer
      t.timestamps
    end

    create_table :sales do |t|
      t.belongs_to :cashier
      t.belongs_to :customer
      t.timestamps
    end

    create_table :cashier do |t|
      t.column :username, :string
      t.timestamps
    end

    create_table :customer do |t|
      t.column :name, :string
      t.timestamps
    end
  end
end
