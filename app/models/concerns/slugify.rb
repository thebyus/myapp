module Slugify

  def to_param
    self.slug
  end

  def generate_slug(model, var)  #Post, self.title
    str = to_slug(var)
    count = 2
    obj = model.where(slug: str).first
    while obj && obj != self
      str = str + "-" + count.to_s
      obj = model.where(slug: str).first
      count += 1
    end
    self.slug = str.downcase
  end


  def to_slug(name)
    #strip the string
    ret = name.strip

    #blow away apostrophes
    ret.gsub! /['`]/,""

    # @ --> at, and & --> and
    ret.gsub! /\s*@\s*/, " at "
    ret.gsub! /\s*&\s*/, " and "

    #replace all non alphanumeric with dash
     ret.gsub! /\s*[^A-Za-z0-9]\s*/, '-'

     #convert double dashes to single
     ret.gsub! /-+/,"-"

     #strip off leading/trailing dash
     ret.gsub! /\A[-\.]+|[-\.]+\z/,""

     ret
  end

=begin
  def self.included(base)
  	base.send(:include, InstanceMethods)
  end

	module InstanceMethods

    def generate_slug
      self.slug = self.username.gsub(' ', '-')
    end


  	def to_param
  	  self.slug
  	end

    def to_slug(name)
      #strip the string
      ret = name.strip
 
     #blow away apostrophes
      ret.gsub! /['`]/,""
 
      # @ --> at, and & --> and
      ret.gsub! /\s*@\s*/, " at "
      ret.gsub! /\s*&\s*/, " and "
 
      #replace all non alphanumeric with dash
       ret.gsub! /\s*[^A-Za-z0-9]\s*/, '-'
 
       #convert double dashes to single
       ret.gsub! /-+/,"-"
   
       #strip off leading/trailing dash
       ret.gsub! /\A[-\.]+|[-\.]+\z/,""
 
      ret
    end


    def generate_slug
      str = to_slug(self.username)
      count = 2
      obj = Post.where(slug: str).first
      while obj && obj != self
        str = str + "-" + count.to_s
        obj = Post.where(slug: str).first
        count += 1
      end
      self.slug = str.downcase
      end
=end
end
