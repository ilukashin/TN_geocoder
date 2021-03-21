# frozen_string_literal: true

require_relative 'config/environment'


map '/geocoder' do
  run GeocoderRoutes
end
