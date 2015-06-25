class AddUsernameToSellers < ActiveRecord::Migration
  def change
    add_column :sellers, :username, :string
  end
end
