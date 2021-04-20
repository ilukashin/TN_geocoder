@channel = RabbitMq.consumer_channel
queue = @channel.queue('geocoding', durable: true)

def consumer_work(delivery_info, properties, payload)
  payload = JSON(payload)

  Thread.current[:request_id] = properties.headers['request_id']

  coordinates = Geocoder.geocode(payload['city'])

  Application.logger.info('geocoded coordinates', city: payload['city'], coordinates: coordinates)

  if coordinates.present?
    Metrics.geocoding_requests_total.increment(labels: { result: 'success'})
    client = AdsService::RpcClient.fetch
    client.update_coordinates(payload['id'], coordinates)
  else
    Metrics.geocoding_requests_total.increment(labels: { result: 'failure'})
  end

  @channel.ack(delivery_info.delivery_tag)
end

queue.subscribe(manual_ack: true) do |delivery_info, properties, payload|
  Metrics.geocoder_request_duration_seconds.observe(
    Benchmark.realtime { consumer_work(delivery_info, properties, payload) },
    labels: { service: 'geocoder' }
  )
end
