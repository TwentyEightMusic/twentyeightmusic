require File.expand_path('../boot', __FILE__)
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module Twentyeightmusic
  class Application < Rails::Application
    config.filepicker_rails.api_key = ENV["FILEPICKER_API_KEY"]
    config.filepicker_rails.secret_key = ENV["FILEPICKER_SECRET_KEY"]
    config.time_zone = "Eastern Time (US & Canada)"
  end
end
