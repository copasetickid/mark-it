class Bookmark < ActiveRecord::Base
  validates :title, :uri, presence: true

  belongs_to :user
end
