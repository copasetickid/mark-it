require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe "associations / relationships" do
    it { should have_many :taggings }
  end
end
