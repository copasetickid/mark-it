class Bookmark < ActiveRecord::Base
  validates :title, :uri, presence: true
  
  belongs_to :user

  has_many :taggings
  has_many :tags, :through => :taggings, dependent: :destroy

  before_create :add_url_protocol

  def tag_names=(names)
  	tag_names = names.split(",").collect{|s| s.strip.downcase}.uniq
  	new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
  	self.tags = new_or_found_tags
  end

  def tag_names
  	self.tags.map(&:name).join(",")
  end

  protected

  def add_url_protocol
    unless self.uri[/\Ahttp:\/\//] || self.uri[/\Ahttps:\/\//]
      self.uri = "http://#{self.uri}"
    end
  end
end
