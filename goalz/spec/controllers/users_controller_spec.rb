require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    
    describe 'get#new' do 
        it 'renders new user page' do
            get :new
            expect(response).to render_template(:new)
        end
    end

    describe 'get#show' do
        it 'renders the specified user page' do
            let(:user) {User.create(username: 'Cool Dude',password: 'Lebowski')}
            get :show
            expect(response).to redirect_to(user_url(user))
        end

    end

    describe 'post#create' do

    end

end
