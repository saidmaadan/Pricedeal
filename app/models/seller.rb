class Seller < ActiveRecord::Base
	if Rails.env.development?
		has_attached_file :image, :styles => { :medium => "200x200>", :thumb => "100x100>" }, :default_url => "no-images.jpg"
	else
	has_attached_file :image, :styles => { :medium => "200x200>", :thumb => "100x100>" }, :default_url => "no-images.jpg",
					   				:storage => :dropbox,
								    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
								    # :dropbox_options => {...}
								     :path => ":style/:id_:filename"
	end
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
