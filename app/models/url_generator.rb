class UrlGenerator
  include ActionDispatch::Routing
  include Rails.application.routes.url_helpers
  include Singleton

  def self.default_url_options
    { host: ENV['CHATISTO_URL_HOST'],
      port: ENV['CHATISTO_URL_PORT'],
      protocol: ENV['CHATISTO_URL_PROTOCOL'] }
  end
end
