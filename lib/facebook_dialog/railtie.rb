require "facebook_dialog/script_helper"

module FacebookDialog
  class Railtie < Rails::Railtie
    ActiveSupport.on_load(:action_controller) do
      helper FacebookDialog::ScriptHelper
    end
  end
end
