RSpec.describe GeocoderRoutes, type: :routes do

  describe 'valid city' do
    it 'returns coordinates' do
      post '/', city: 'City 17'

      expect(last_response.status).to eq(200)
      expect(last_response.body).to eq("[45.05,90.05]")
    end
  end

  describe 'invalid city' do
    it 'returns nothing' do
      post '/', city: 'Мск'

      expect(last_response.status).to eq(204)
      expect(last_response.body).to be_blank
    end
  end
  
end
