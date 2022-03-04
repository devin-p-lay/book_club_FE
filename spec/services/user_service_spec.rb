require 'rails_helper'

RSpec.describe UserService do
  describe 'class methods' do
    describe 'get_user' do
      it 'returns a user data', :vcr do
        response = UserService.get_user(1)

        expect(response).to be_a Hash

        expect(response).to have_key :id
        expect(response[:id]).to be_a String

        expect(response[:attributes]).to have_key :username
        expect(response[:attributes][:username]).to be_a String

        expect(response[:attributes]).to have_key :email
        expect(response[:attributes][:email]).to be_a String
      end
    end

    describe 'get_all_users' do
      it 'returns data for all users', :vcr do
        response = UserService.get_all_users

        expect(response).to be_a Array

        response.each do |user|
          expect(user).to have_key :id
          expect(user[:id]).to be_a String

          expect(user[:attributes]).to have_key :username
          expect(user[:attributes][:username]).to be_a String

          expect(user[:attributes]).to have_key :email
          expect(user[:attributes][:email]).to be_a String
        end
      end
    end
  end
end
