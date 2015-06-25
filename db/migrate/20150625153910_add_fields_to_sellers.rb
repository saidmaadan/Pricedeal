class AddFieldsToSellers < ActiveRecord::Migration
  def change
    add_column :sellers, :first_name, :string
    add_column :sellers, :last_name, :string
    add_column :sellers, :website, :string
    add_column :sellers, :phone, :string
    add_column :sellers, :address, :string
    add_column :sellers, :twitter, :string
    add_column :sellers, :about, :text
  end
end
