require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe 'index' do
    it 'call' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
end
