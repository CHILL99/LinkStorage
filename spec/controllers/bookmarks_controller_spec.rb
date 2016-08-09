require 'rails_helper'

RSpec.describe BookmarksController do
  let(:user)      { create(:user) }
  let!(:bookmark) { create(:bookmark) }
  
  before do
    sign_in(user)
    @request.env['HTTP_REFERER'] = 'http://localhost'
  end

  describe '#index' do
    it 'gets index' do
      get 'index'
      expect(response).to render_template("index")
    end
  end
  
  describe '#new' do
    it 'renders new form' do
      get 'new'
      expect(response).to be_success
    end
  end

  describe '#create' do
    context 'with valid params' do
      let(:params) { { content: Faker::Internet.url,
                       description: Faker::Lorem.paragraph,
                       } }

      before(:each) do
        post :create, bookmark: params
      end

      it 'redirect to bookmarks index page' do
        expect(response).to redirect_to(authenticated_root_path)
      end

      it 'creates new bookmark' do
        expect { post :create, bookmark: params }.to change(Bookmark, :count).by(1)
      end
    end
  
    context 'with invalid params' do
      let(:params) { {description: Faker::Lorem.paragraph } }

      before(:each) do
        post :create, bookmark: params
      end

      it 'render form again' do
        expect(response).to render_template('bookmarks/new')
      end
    end
  end

  describe '#edit' do
    it 'renders form' do
      sign_in(bookmark.user)
      get 'edit', { id: bookmark.id }
      expect(response).to be_success
    end
  end
  
end
