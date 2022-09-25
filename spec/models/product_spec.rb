require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many_attached(:images) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:cart_items).dependent(:destroy) }
    it { should have_many(:carts).through(:cart_items) }
  end

  describe 'validations' do
    before { product =  create(:product) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:description) }
    it { should validate_uniqueness_of(:name) }
  end
end
