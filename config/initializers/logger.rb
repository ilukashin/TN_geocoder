logdev = Application.environment.eql?('production') ? STDOUT : Application.root.concat('/', Settings.logger.path)

logger = Ougai::Logger.new(
  logdev,
  level: Settings.logger.level
)

logger.before_log = lambda do |data|
  data[:service] = { name: Settings.app.name }
  data[:request_id] ||= Thread.current[:request_id]
end

Application.logger = logger
