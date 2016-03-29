Raven.configure do |config|
  config.dsn = 'https://a30c9a63964a47f39ed3d74627aca629:691e18414fab45fca00a039cd8c0600e@chatisto-reporting.herokuapp.com/2'
  config.environments = ['staging', 'production']
  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)

  raven_logger = ::Logger.new(STDOUT)
  raven_logger.level = ::Logger::WARN
  config.logger = raven_logger
end
