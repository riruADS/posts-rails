require 'rails_helper'

RSpec.describe User, type: :model do
  
  it 'should have valid factory' do
    expect(FactoryGirl.create(:user)).to be_valid
  end
  
  context 'relationship' do
    it { should have_many(:active_friends) }
    it { should have_many(:friendships) }
    it { should have_many(:posts) }
    it { should have_many(:pending_friends) }
    it { should have_many(:received_friends) }
    it { should have_many(:requested_friendships) }
  end
  
  context 'validations' do
    context 'fields' do
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:password) }
    end
  end
end
