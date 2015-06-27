class Order < ActiveRecord::Base
	validates :state, :city, :state, :country, presence: true

	belongs_to :product
	belongs_to :seller
	belongs_to :buyer
end
