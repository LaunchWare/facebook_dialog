require "facebook_dialog/script_helper"

module FacebookDialog
  class Railtie < Rails::Railtie
    ActiveSupport.on_load(:action_controller) do
      helper FacebookDialog::ScriptHelper
      if FacebookDialog.omniauth_enabled?
        require "facebook_dialog/omni_auth_helper"
        helper FacebookDialog::OmniAuthHelper
      end
    end
  end
end
