class AddFieldsToBuyers < ActiveRecord::Migration
  def change
    add_column :buyers, :first_name, :string
    add_column :buyers, :last_name, :string
    add_column :buyers, :street, :string
    add_column :buyers, :city, :string
    add_column :buyers, :state, :string
    add_column :buyers, :apt, :string
    add_column :buyers, :zip_code, :string
    add_column :buyers, :country, :string
  end
end
