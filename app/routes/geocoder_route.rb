class GeocoderRoutes < Application

  post do
    coordinates = Geocoder.geocode(ad.city)

    if coordinates.blank?
      status 401
      {}.to_json
    else
      status 200
      coordinates.to_json
    end
  end
end
