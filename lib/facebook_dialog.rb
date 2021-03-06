require "rack/utils"
require "active_model"
require "active_support/core_ext/class"
require "configatron"

require "facebook_dialog/version"
require "facebook_dialog/dialog"
require "facebook_dialog/validators"
require "facebook_dialog/option_serialization"

require "facebook_dialog/oauth"
require "facebook_dialog/feed"

module FacebookDialog
  def self.api_key
    configatron.facebook_dialog.api_key
  end

  def self.api_key=(api_key)
    configatron.facebook_dialog.api_key = api_key
  end

  #set of available display modes from facebook
  #if you specify wap, you must supply an access_token
  def self.display_modes
    [
      "page", 
      "popup", 
      "iframe", 
      "touch", 
      "wap"
    ]
  end 

  def self.omniauth_enabled?
    defined?(::OmniAuth) && defined?(::OmniAuth::Strategies::Facebook)
  end


  class ResourceNameNotDefined < Exception; end;
  class InvalidDisplay < Exception; end;
end

require "facebook_dialog/omni_auth" if FacebookDialog.omniauth_enabled?
require "facebook_dialog/railtie" if defined?(Rails)

