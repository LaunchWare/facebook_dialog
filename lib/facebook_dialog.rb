require "rack/utils"
require "active_model"
require "configatron"

require "facebook_dialog/version"
require "facebook_dialog/feed"

module FacebookDialog
  def self.api_key
    configatron.facebook_dialog.api_key
  end

  def self.api_key=(api_key)
    configatron.facebook_dialog.api_key = api_key
  end
end

require "facebook_dialog/railtie" if defined?(Rails)