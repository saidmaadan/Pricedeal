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
	validates :first_name, :last_name, presence: true
	validates :username, presence: true,
                     format: /\A[A-Z0-9]+\z/i,
                     uniqueness: { case_sensitive: false }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_many :products, dependent: :destroy
end
