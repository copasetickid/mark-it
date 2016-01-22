require 'rails_helper'

RSpec.describe Tagging, type: :model do
   describe "associations / relationships" do
    it { should belong_to :bookmark }
    it { should belong_to :tag }
  end
end
