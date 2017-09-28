require 'rails_helper'

RSpec.describe Friendship, type: :model do
  user = FactoryGirl.create(:user)
  friend = FactoryGirl.create(:user)
  
  it 'should have valid factory' do
    expect(FactoryGirl.create(:friendship, user: user, friend: friend)).to be_valid
  end
  
  context 'relationship' do
    it { should belong_to(:user) }
    it { should belong_to(:friend) }
  end
end
