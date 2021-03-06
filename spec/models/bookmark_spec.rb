require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  describe "validations" do
    it { validate_presence_of :title }
    it { validate_presence_of :uri }
  end


  describe "associations / relationships" do
    it { should belong_to :user }
    it { should have_many :taggings }
    it { should have_many(:tags).through(:taggings) }
  end
end
