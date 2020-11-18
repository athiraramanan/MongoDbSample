# Change this ArticlesController to your project
# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Api::UserController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Article. As you add validations to Article, be sure to adjust the attributes here as well.
  let!(:user) { create(:user) }

  describe 'Get User#index' do
    context 'Get all users' do
      it 'returns all users' do
        request.content_type = 'application/json'
        get :index, params: {} 
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'Post User#create' do
    context 'Create a user' do
      it 'creates a user' do
        request.content_type = 'application/json'
        post :create, params: { id: 1, firstName: 'Athira', lastName: 'Savin', email: 'athirasavin@gmail.com' }
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'Put User#update' do
    context 'Update a user' do
      it 'update a user' do
        request.content_type = 'application/json'
        post :create, params: { id: 3, firstName: 'Athira', lastName: 'Savin', email: 'athirasavin@gmail.com' }
        post :update, params: { id: 3, email: 'athirasavin29@gmail.com' }
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'Show User#show' do
    context 'Get a requested user' do
      it 'returns the requested user' do
        request.content_type = 'application/json'
        post :create, params: { id: 4, firstName: 'Athira', lastName: 'Savin', email: 'athirasavin@gmail.com' }
        get :show, params: {id: 4} 
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'Delete User#delete' do
    context 'Destroy a requested user' do
      it 'delete the requested user' do
        request.content_type = 'application/json'
        post :create, params: { id: 45, firstName: 'Athira', lastName: 'Savin', email: 'athirasavin@gmail.com' }
        get :destroy, params: {id: 45} 
        expect(response).to have_http_status(200)
      end
    end
  end
  
  describe 'responds to' do
    context 'Responds to a request' do
      it "responds to custom formats when provided in the params" do
        post :create, params: { id: 45, firstName: 'Athira', lastName: 'Savin', email: 'athirasavin@gmail.com' }
        expect(response.content_type).to eq "application/json; charset=utf-8"
      end
    end
  end

   describe 'Delete User#delete' do
    context 'Destroy a requested user' do
      it 'delete the requested user' do
        request.content_type = 'application/json'
        get :destroy, params: {id: 55} 
        expect(response).to have_http_status(404)
      end
    end
  end

end