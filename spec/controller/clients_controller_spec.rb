require 'rails_helper'

RSpec.describe Api::ClientsController, type: :controller do

  describe 'Create : POST client#sign_up' do
    pending 'takes all client data and creates a record' do
      post :create,  client: { FactoryBot.attributes_for(:client)}
      expect(response.status).to eq(:success)
      response_data = JSON.parse(response.body)
      expect(response_data['client_id'].present?).to eq true
      expect(response_data['is_confirmed']).to eq(false)
      expect(Client.count).to eq 1
    end

    pending 'generates otp'
    pending 'verifies otp and marks is_confirmed = true'
    pending 'saves device details'
    pending 'generates auth token'
  end

  describe 'Sign in : GET' do
    pending 'accepts username, password, device id and vendor id'
    pending 'verify username and password' do
      it 'gives 200 status code if it matches'
      it 'gives unauthorized error if not matched'
    end
    pending 'find/create device record'
    pending 'generate auth token'
  end

  describe '#show : GET clients details' do
    before(:each) do
      client = FactoryBot.create(:client, first_name: 'abc')
      device = create(:device, client_id: client.id)
      request.headers['Authorization'] = device.auth_token
    end

    pending 'gives clients details' do
      get :show, params: {id: client.id}
      response_body = JSON.parse(response.body)
      expect(response_body['first_name']).to eq('abc')
    end
  end
end