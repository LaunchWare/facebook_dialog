module FacebookDialog
  module OmniAuth
    def self.dialog(additional_options = {})
      options = authorize_params.merge(additional_options) 
      options[:redirect_uri] ||= hacked_app.callback_url
      FacebookDialog::Oauth.new(options.merge(authorize_params))
    end 

    protected
    def self.authorize_params
      hacked_app.authorize_params.merge(hacked_app.client.auth_code.authorize_params)
    end

    def self.hacked_app
      @hacked_app ||= OmniAuthHack.new(MockRack.new)
    end

    class MockRack
      def call(env)
        [200, {}, []]
      end
    end

    class OmniAuthHack < ::OmniAuth::Strategies::Facebook
      option :name, "facebook"
      protected
      def request
        @env = Rack::MockRequest.env_for("", {"rack.session" => {}})
        super
      end
    end
  end
end
