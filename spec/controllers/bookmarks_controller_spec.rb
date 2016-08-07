require 'rails_helper'

RSpec.describe BookmarksController do
  let(:user)      { create(:user) }
  let!(:bookmark) { create(:bookmark) }
  
  before do
    sign_in(user)
    @request.env['HTTP_REFERER'] = 'http://localhost'
  end

  describe '#index' do
    it 'should get index' do
      get 'index'
      expect(response).to render_template("index")
    end
  end
  
  describe '#new' do
    it 'should render new form' do
      get 'new'
      expect(response).to be_success
    end
  end

  
  describe '#edit' do
    it 'should render form' do
      get 'edit', { id: bookmark.id }
      expect(response).to be_success
    end
  end

end