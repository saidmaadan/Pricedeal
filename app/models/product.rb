class Product < ActiveRecord::Base
	if Rails.env.development?
		has_attached_file :image, :styles => { :medium => "200x200>", :thumb => "100x100>" }, :default_url => "no-images.jpg"
	else
	has_attached_file :image, :styles => { :medium => "200x200>", :thumb => "100x100>" }, :default_url => "no-images.jpg",
					   				:storage => :dropbox,
								    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
								    # :dropbox_options => {...}
								     :path => ":style/:id_:filename"
	end
	 validates :name, :description, :price, presence: true
	 validates :price, numericality: { greater_than: 0 }
	 validates_attachment_presence :image
 	 validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
 	 
 	 belongs_to :seller
 	 has_many :orders
end
