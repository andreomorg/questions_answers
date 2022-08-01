require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe 'when call index' do
    Category.create(name: 'Matematica')
    Category.create(name: 'Portugues')
    it 'then return a list of categories' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
end
