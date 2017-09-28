require 'rails_helper'

RSpec.describe Post, type: :model do
  user = FactoryGirl.create(:user)
  
  it 'should have valid factory' do
    expect(FactoryGirl.create(:post, user: user)).to be_valid
  end
  
  context 'relationship' do
    it { should belong_to(:user) }
  end
  
  context 'validations' do
    context 'relationships' do
      it { should validate_presence_of(:user)}
    end
    
    context 'fields' do
      it { should validate_presence_of(:title)}
    end
  end
end
