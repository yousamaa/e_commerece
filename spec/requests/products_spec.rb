require 'rails_helper'

RSpec.describe "Products", type: :request do
  context 'user available' do
    let!(:user) { create(:user) }
    let!(:product) { create(:product, user_id: user.id) }

    before do
      sign_in user
    end

    describe 'GET /index' do
      it 'returns a success response' do
        get products_path
        expect(response).to be_successful
        expect(response).to render_template(:index)
      end
    end

    describe 'GET /show' do
      it 'returns a success response' do
        get product_path(product.id)
        expect(response).to be_success
        expect(response).to render_template(:show)
      end

      it 'returns a failure response' do
        sign_out user
        get product_path(product.id)
        expect(response).not_to be_success
        expect(response).to redirect_to(user_session_path)
      end

      it 'it doesnot find a product' do
        get product_path(9)
        expect(response).not_to be_success
        expect(response).to redirect_to(root_path)
      end
    end

    describe 'GET /new' do
      it 'assigns a new product to Product' do
        get new_product_path
        expect(assigns(:product)).to be_a_new(Product)
      end
    end

    describe 'GET /edit' do
      let(:params) { { product_id: product.id } }

      it 'edits a product' do
        get edit_product_path(product.id)
        expect(response).to be_successful
        expect(response).to render_template(:edit)
      end
    end

    describe 'POST /create' do
      let!(:params) { { name: product.name, price: product.price, description: product.description, images: [] } }

      it 'when product not created' do
        expect { post products_path, params: params, as: :json }.to change { Product.count }.by(0)
      end

      it 'creating a product' do
        params[:name] = 'mypro'
        expect { post products_path, params: params, as: :json }.to change { Product.count }.by(1)
        expect(flash[:notice]).to eq('Product was successfully created.')
      end
    end

    describe 'PATCH /update' do
      let(:params) { { name: product.name, price: product.price, description: product.description, images: [] } }

      it 'its updates a product' do
        product.save
        product.name = 'new'
        patch product_path(product), params: params, as: :json
        expect(Product.last.name).to eq('new')
        expect(response).to redirect_to(product_path)
      end

      let(:product1) { create(:product, user_id: user.id) }

      it 'when product not created' do
        expect { put product_path(id: product1.id), params: params, as: :json }.to change { Product.count }.by(1)
      end
    end

    describe 'DELETE /destroy' do
      let(:params) { { id: product.id } }
      
      context 'User is signed in' do
        it 'its deleting a product' do
          expect { delete product_path(product.id), params: params.to_json }.to change { Product.count }.by(-1)
          expect(response).to redirect_to(products_path)
        end
        
        it 'its not deleting a product' do
          allow_any_instance_of(Product).to receive(:destroy).and_return(false)
          expect { delete product_path(product.id), params: params.to_json }.to change { Product.count }.by(0)
          expect(flash.alert).to eq('Product was not deleted.')
        end

        it 'its not deleting a product' do
          expect { delete product_path(0), params: params.to_json }.to change { Product.count }.by(0)
          expect(response).to redirect_to(root_path)
        end
      end

      context 'User is signed out' do
        it 'its not deleting a product' do
          sign_out user
          expect { delete product_path(product.id), params: params.to_json }.to change { Product.count }.by(0)
          expect(response).to redirect_to(user_session_path)
        end
      end
    end

    describe 'GET /search' do
      it 'returns a success response' do
        get search_products_path
        expect(response).to be_successful
      end
    end
  end
end
