class Airport
  include HTTParty

  def initialize(country)
    @response = HTTParty.get("http://www.webservicex.net/airport.asmx/GetAirportInformationByCountry?country=#{country}")

    @response
  end

  def all
    @response.to_xml
  end


end
