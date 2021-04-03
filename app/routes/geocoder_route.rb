# frozen_string_literal: true

class GeocoderRoutes < Application
  post '/' do
    coordinates = Geocoder.geocode(params['city'])

    if coordinates.blank?
      status 204
      {}.to_json
    else
      status 200
      coordinates.to_json
    end
  end
end
