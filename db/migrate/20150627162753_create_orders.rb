class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :apt
      t.string :zip_code
      t.string :country

      t.timestamps
    end
  end
end
