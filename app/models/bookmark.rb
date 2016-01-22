class Bookmark < ActiveRecord::Base
  validates :title, :uri, presence: true

  belongs_to :user

  has_many :taggings
  has_many :tags, :through => :taggings


  def tag_names=(names)
  	tag_names = names.split(",").collect{|s| s.strip.downcase}.uniq
  	new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
  	self.tags = new_or_found_tags
  end

  def tag_names
  	self.tags.map(&:name).join(",")
  end
end
