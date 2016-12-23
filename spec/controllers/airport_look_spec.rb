RSpec.describe AirportLookupController, type: :controller do

  describe '#index' do
    it 'responses with status 200' do
      get :index
      expect(response.status).to eq(200)
    end

    it 'response xml content_type of airports when have country params' do
      VCR.use_cassette("airport_xml") do
        get :index, country: 'cambodia'
        expect(response.content_type).to eq "application/xml"
      end
    end
  end
end
