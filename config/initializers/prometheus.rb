require 'prometheus/client' 
require 'prometheus/middleware/exporter'

Metrics.configure do |registry|
  registry.counter(
    :geocoding_requests_total,
    docstring: 'The total number of geocoding requests',
    labels: %i[result]
  )

  registry.histogram(
    :geocoder_request_duration_seconds,
    docstring: 'Response duration',
    labels: %i[service]  
  )
  
end
