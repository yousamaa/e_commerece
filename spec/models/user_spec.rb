require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create(:user) }
  describe 'associations' do
    it { should have_one_attached(:avatar) }
    it { should have_many(:products).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:carts).dependent(:destroy) }
    it { should have_many(:coupons).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end

  it "add default avatar on commit" do
    expect(user.add_default_avatar).to eq(nil)
  end

  it "triggers to give user a default avatar" do
    expect(user.avatar_thumbnail).to eq(user.avatar)
  end
end
