class Recipe < ActiveRecord::Base
	has_many :ingredients
	has_many :preperations
	belongs_to :user

	accepts_nested_attributes_for :ingredients,
																reject_if: proc { |attributes| attributes['name'].blank? },
																allow_destroy: true
	accepts_nested_attributes_for :preperations,
																reject_if: proc { |attributes| attributes['step'].blank? },
																allow_destroy: true
	 validates :title, :description, :image, presence:true
	 has_attached_file :image, styles: { medium: "400x400#" }
	 validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
