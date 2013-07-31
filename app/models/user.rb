class User < ActiveRecord::Base
  include Slugifyeobrien 
  
  has_many :posts
  has_many :comments
  has_many :votes

  has_secure_password validations: false

  validates :username,
    presence: true,
    uniqueness: true
  validates :password,
    presence: true,
    on: :create,
    length: { minimum: 5 }

    after_validation :slug_this

  def already_voted_on?(obj)
    self.votes.where(voteable: obj).size > 0
  end

  def admin?
    self.role == 'admin'
  end

=begin
  def generate_slug
    self.slug = self.username.gsub(' ', '-')
  end

  def to_param
    self.slug
  end
=end


  def slug_this
   generate_slug(Category, self.username)
  end
end