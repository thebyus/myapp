class Category < ActiveRecord::Base
  include Slugify

  has_many :post_categories
  has_many :posts, through: :post_categories

  validates :name, presence: true, uniqueness: true

  after_validation :slug_this

  def slug_this
   generate_slug(Category, self.name)
  end

=begin

  def generate_slug
  	self.slug = self.name.gsub(' ', '-')
  end


  def to_param
  	self.slug
  end
=end
end
