class Category < ActiveRecord::Base
 # include Slugify

  has_many :post_categories
  has_many :posts, through: :post_categories

  validates :name, presence: true, uniqueness: true

  after_validation :generate_slug

  def generate_slug
  	self.slug = self.username.gsub(' ', '-')
  end


  def to_param
  	self.slug
  end
end
