require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations / relationships" do
    it { should have_many :bookmarks }
  end
end
