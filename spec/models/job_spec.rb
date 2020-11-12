require 'rails_helper'

RSpec.describe Job, type: :model do
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should have_many(:periods) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:title) }
  end
end
