require 'rails_helper'

RSpec.describe Api::OrdersController, type: :controller do

  let!(:client) { create(:client) }
  let!(:vendor) { create(:vendor) }
  describe '#create' do
    before (:each) do
      user_sign_in(client)
    end
    pending 'creates with valid attributes' do 
      post :create,  order: { FactoryBot.attributes_for(:order), client_id: client.id }
      expect(response).to have_http_status(:success)
      response_data = JSON.parse(response.body)
      expect(response_data['order_id'].present?).to eq true
      expect(Order.count).to eq 1
    end
  end

  describe 'GET-Edit Order' do
    before (:each) do
      user_sign_in(client)
    end
    pending 'Edit Order' do
      image = 'xyz.jpg'
      comment = 'abc' 
      order   = FactoryBot.create(:order, client_id: client.id,
                image: image, comment: comment)
      get :edit, id: order_id.to_s
      expect(response).to have_http_status(:success)
      response_data = JSON.parse(response.body)
      expect(response_data['image']).to eq 'xyz.jpg'
      expect(response_data['comment']).to eq 'abc'
    end
  end

  describe 'PUT - Updates existing order' do
    before (:each) do
      user_sign_in(client)
    end
    pending 'Updates order' do
      order = FactoryBot.create(:order, client_id: client.id)
      put :update,  id: order.id.to_s, order: { comment: 'abc' }
      expect(response).to have_http_status(:success)
      response_data = JSON.parse(response.body)
      expect(response_data['order_id'].present?).to eq true
      expect(order.reload.comment).to eq 'abc'
    end
  end

  describe '#client_orders GET - Get all clients orders' do
    before (:each) do
      user_sign_in(client)
      FactoryBot.create_list(:order, 3, client_id: client.id,
                             comment: 'abc')
    end
    pending 'get all orders of client' do
      get :order, client_id: client.id
      expect(response).to have_http_status(:success)
      response_data = JSON.parse(response.body)
      expect(response_data.count).to eq 3
      expect(response_data[0]['comment']).to eq 'abc'
    end
  end

  describe '#vendor_orders GET - Get all vendors orders' do
    before (:each) do
      user_sign_in(client)
      FactoryBot.create_list(:order, 3, client_id: client.id,
                             comment: 'abc', vendor_id: vendor.id)
    end
    pending 'get all orders of client' do
      get :order, client_id: client.id
      expect(response).to have_http_status(:success)
      response_data = JSON.parse(response.body)
      expect(response_data.count).to eq 3
      expect(response_data[0]['comment']).to eq 'abc'
    end
  end
end