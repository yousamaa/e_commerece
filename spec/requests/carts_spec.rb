require 'rails_helper'

RSpec.describe "Carts", type: :request do
  let!(:user) { create(:user) }
  let!(:cart) { create(:cart, user_id: user.id) }

  before do
    sign_in user
  end

  describe 'GET /show' do
    it 'returns a success response' do
      get cart_path(cart.id)
      expect(response).to be_success
      expect(response).to render_template(:show)
    end
  end

  describe 'DELETE /destroy' do
    let!(:params) { { id: cart.id } }

    it 'its deleting a cart' do
      expect { delete cart_path(cart.id), params: params.to_json }.to change { Cart.count }.by(0)
      expect(flash.notice).to eq('Cart deleted successfully!')
    end

    it 'its not deleting a cart' do
      allow_any_instance_of(Cart).to receive(:destroy).and_return(false)
      expect { delete cart_path(cart.id), params: params.to_json }.to change { Cart.count }.by(1)
      expect(flash.alert).to eq('Cart not deleted!.')
    end
  end
end
