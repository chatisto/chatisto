if Rails.env.production?
  Rails.application.config.action_cable.allowed_request_origins = ['http://chatisto.com',
                                                                   'http://chatisto.herokuapp.com',
                                                                   'https://chatisto.com',
                                                                   'https://chatisto.herokuapp.com']
else
  Rails.application.config.action_cable.disable_request_forgery_protection = true
end
